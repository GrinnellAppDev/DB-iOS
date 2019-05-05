import json

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT # Added
import sys, os
import numpy as np
#import pandas as pd
import test_psql as creds #database access information
#import pandas.io.sql as psql

import smtplib, ssl
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from flask import Flask

from flask import request
from flask import Response

app = Flask(__name__)

@app.route("/")


def hello():
    #Deletes table when requested
    reset_param = request.args.get('reset')
    if reset_param is not None and reset_param == "reset":
        create_table("public", "users")
    
    #connect to database with information from
    conn_string = "host="+ creds.PGHOST +" port="+ "5432" +" dbname="+ creds.PGDATABASE +" user=" + creds.PGUSER \
    +" password="+ creds.PGPASSWORD
    conn=psycopg2.connect(conn_string)

    print("Connected for data scraping")
    print(request.query_string)
    type = request.args.get('type')
    # Create a cursor object
    cursor = conn.cursor()
    #determine if data is being added or requested or removed
    if(type == "request"):
        request_data(cursor, name=request.args.get('fac'))
    elif(type == "add"):
        #access required given data
        data=dict()
        data["fac"]=request.args.get('fac')
        data["day"]=request.args.get('day')
        data["times"]=request.args.get('times')
        add(data, cursor, "public", "users")
        #print data to see if addition was successful
        rows = request_pending_data(cursor)
        send_verification_request(rows)

    elif(type == "remove"):
        #access required given data
        data=dict()
        id=request.args.get('id')
        remove(id, cursor, "public", "users")
        #print data to see if removal was successful
        cursor.execute(("""SELECT * from {0}.{1};""").format("public", "users"), ())
        for row in cursor.fetchall():
            print(row)
        print('')
    elif(type=="accept"):
        #access required given data
        data=dict()
        id=request.args.get('id')
        accept(id, cursor, "public", "users")
        #print data to see if removal was successful
        cursor.execute(("""SELECT * FROM {0}.{1} WHERE pending = TRUE;""").format("public", "users"), ())
        for row in cursor.fetchall():
            print(row)
        print('')
    elif(type=="decline"):
        #access required given data
        data=dict()
        id=request.args.get('id')
        remove(id, cursor, "public", "users")
        #print data to see if removal was successful
        cursor.execute(("""SELECT * from {0}.{1} where pending = TRUE;""").format("public", "users"), ())
        for row in cursor.fetchall():
            print(row)
        print('')

    #finish up database interactions
    conn.commit()
    cursor.close()
    conn.close()

    #static data for testing
    b = list()
#b.append(populate())
#b.append(populate(id=1))
#b.append(populate(id=2))
    return Response(json.dumps(b), mimetype='json/application')


"""
Allows to add new data to the given table in the given schema using the provided cursor, the entry is automatically pending
"""
def add(data, cursor, schema, table):
    sql_command = ("""INSERT INTO {0}.{1} (user_name, weekday,office_hour)
        VALUES ('{2}', '{3}','{4}');""").format(str(schema), str(table),str(data["fac"]),str(data["day"]),str(data["times"]))
    print (sql_command)
    cursor.execute("""INSERT INTO {0}.{1} (user_name, weekday,office_hour)
        VALUES (%s, %s, %s);""".format(str(schema), str(table)),   (str(data["fac"]),str(data["day"]),str(data["times"])))

"""
Deletes the row in the given table in the given schema with the cursor where the entry_id equals the given id
"""
def remove(id, cursor, schema, table):
    sql_command = ("""DELETE FROM {0}.{1} WHERE entry_id = %s;""").format(str(schema), str(table))
    print (sql_command)
    cursor.execute(sql_command, (id,))
"""
    Updates the row in the given table in the given schema with the cursor where the entry_id equals the given id to not be pending
    """
def accept(id, cursor, schema, table):
    sql_command = ("""UPDATE {0}.{1} SET pending = FALSE WHERE entry_id = %s;""").format(str(schema), str(table))
    print (sql_command)
    cursor.execute(sql_command,(id,))

"""
Queries all the office hour data in the users table in the public schema with the professor with the given name
"""
def request_data(cursor, name=""):
    sql_command = ("""SELECT entry_id, user_name, weekday, office_hour from {0}.{1} WHERE user_name = %s AND pending = FALSE;""").format("public", "users")
    print (sql_command)
    
    cursor.execute(sql_command, (str(name), ))
    
    out = []
    for row in cursor.fetchall():
        out.append(row)
        print(row)
    print('')

    return out

"""
    Queries all the office hour data in the users table in the public schema with pending true
"""
def request_pending_data(cursor):
    sql_command = ("""SELECT entry_id, user_name, weekday, office_hour from {0}.{1} WHERE pending = true;""").format("public", "users")
    print (sql_command)
    
    cursor.execute(sql_command, ())
    
    out = []
    for row in cursor.fetchall():
        out.append(row)
        print(row)
    print('')
    return out

"""
Prints out the query response
"""
def show_query(title, qry):
    print('%s' % (title))
    cur.execute(qry)
    for row in cur.fetchall():
        print(row)
    print('')

"""
Creates the given table in the given schema,
The table consists of
    an auto-incremented entry_id,
    non-null varchar(255) user_name,
    non-null varchar(2) weekday,
    non-null varchar(255) office_hour
if it already exists then the old version will be dropped
Currently contains static basic entries for testing purposes
"""
def create_table(schema, table):
    #connect to database
    conn_string = "host="+ creds.PGHOST +" port="+ "5432" +" dbname="+ creds.PGDATABASE +" user=" + creds.PGUSER \
    +" password="+ creds.PGPASSWORD
    conn=psycopg2.connect(conn_string)
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT) # Added
    print("Connected for table creation!")

    # Create a cursor object
    cursor = conn.cursor()
    sql_command = ("""DROP TABLE IF EXISTS {0}.{1};""").format(str(schema), str(table))
    print (sql_command)
    
    # Create table
    cursor.execute(sql_command, ())
    sql_command = ("""CREATE TABLE {0}.{1} (
                   entry_id SERIAL,
                   user_name varchar(255) NOT NULL,
                   weekday varchar(2) NOT NULL,
                   office_hour varchar(255) NOT NULL,
                   pending boolean not null default true);""").format(str(schema), str(table))
    print (sql_command)
    cursor.execute(sql_command, ())
    
    #insert basic entries for testing
    sql_command = ("""INSERT INTO {0}.{1} (user_name, weekday,office_hour, pending)
        VALUES ('schildor', 'Th','4PM - 5PM, 7PM - 7:30PM', false),
               ('schildor', 'M','1PM - 2PM, 3PM - 3:30PM', true),
               ('turtok', 'F','1AM - 2AM, 5PM - 5:30PM', false);""").format(str(schema), str(table))
    print (sql_command)
    cursor.execute(sql_command, ())
    conn.commit()
    cursor.close()
    conn.close()



def sendemail(from_addr, to_addr_list, cc_addr_list,
              subject, message,
              login, password,
              smtpserver='smtp.gmail.com:587'):
    header  = 'From: %s\n' % from_addr
    header += 'To: %s\n' % ','.join(to_addr_list)
    header += 'Cc: %s\n' % ','.join(cc_addr_list)
    header += 'Subject: %s\n\n' % subject
    message = header + message
    
    server = smtplib.SMTP(smtpserver)
    server.starttls()
    server.login(login,password)
    problems = server.sendmail(from_addr, to_addr_list, message)
    server.quit()


"""
    Sends an email with html parts from from_addr to all elements of to_addr_list and cc_addr_list, with the given subject message and html using the login name, password and the given smtp server.
    The email is encrypted using tls and works with gmail.
    """
def sendhtmlemail(from_addr, to_addr_list, cc_addr_list,
                  subject, message, html,
                  login, password,
                  smtpserver='smtp.gmail.com:587'):
    msg = MIMEMultipart('alternative')
    msg['Subject'] = subject
    msg['From'] = from_addr
    msg['To'] = str(to_addr_list)

    
    header  = 'From: %s\n' % from_addr
    header += 'To: %s\n' % ','.join(to_addr_list)
    header += 'Cc: %s\n' % ','.join(cc_addr_list)
    header += 'Subject: %s\n\n' % subject
    message = header + message
    

    # Record the MIME types of both parts - text/plain and text/html.
    part1 = MIMEText(message, 'plain')
    part2 = MIMEText(html, 'html')

    # Attach parts into message container.
    # According to RFC 2046, the last part of a multipart message, in this case
    # the HTML message, is best and preferred.
    msg.attach(part1)
    msg.attach(part2)

    # Send the message via local SMTP server.
    # sendmail function takes 3 arguments: sender's address, recipient's address
    # and message to send - here it is sent as one string.
    server = smtplib.SMTP(smtpserver)
    server.starttls()
    server.login(login,password)
    problems = server.sendmail(from_addr, to_addr_list, msg.as_string())
    server.quit()

""""
    Sends a verification request for the still pending entries to Appdev gmail to the Appdev school email
    """
def send_verification_request(rows):
    message ="There are pending requests for new office hours:\n"
    # Create the body of the message (a plain-text and an HTML version).
    html = """\
        <html>
        <head></head>
        <body>
        """
    #generate the html code for the buttons
    for row in rows:
        message+= str(row) +"\n"
        html+=str(row) +"\n"
        html+= ("""
            <a href="http://127.0.0.1:5000/?type=accept&id={0}">
            <button>Accept</button>
            </a><a href="http://127.0.0.1:5000/?type=decline&id={0}">
            <button>Decline</button>
            </a><br>
            """).format(row[0])
    html+="""
        </body>
        </html>
        """
    sendhtmlemail("moriz.schildorfer@gmail.com",["schildor@grinnell.edu"],[""],"New Office Hour Request",message,html,'moriz.schildorfer',raw_input("email psswrd"))

"""
    Fluff data to test the connection
    """
def populate(id=0):
    a = dict()
    #Person elements
    if(id==0):
        a["firstName"]="Magnifico"
        a["lastName"]="Lad"
        a["userName"]="Snickers"
        a["box"]="1010"
        a["email"] ="schildor@grinnell.edu"
        a["address"] = "Cool Street 11"
        a["phone"] = "+2037062953"
        a["personType"]="Student"
        a["homeAddress"] = "Cool Lane 12"
        #optional
        a["imgPath"] = "https://cdn3.volusion.com/kceqm.mleru/v/vspfiles/photos/74-2.jpg?1521734349"
        #Student elements
        a["nickName"] = "Lemony Snicket"
        a["classYear"] = "2020"
        a["major"] = "Major Lemon History"
        a["minor"] = "Minor Lemon History"
        #Faculty elements
        a["titles"] = None  #array
        a["departments"] = None  #array
        a["spouse"] = None
        
        #SGA elements
        a["office_email"] = None
        a["office_phone"] = None
        a["office_addr"] = None
        a["office_box"] = None
        a["position_name"] = None
        a["office_hours"] = None #array
    if(id==1):
        
        a["firstName"]="Magnifico2"
        a["lastName"]="Lad"
        a["userName"]="Snickers"
        a["box"]="1010"
        a["email"] ="schildor@grinnell.edu"
        a["address"] = "Cool Street 11"
        a["phone"] = "+2037062953"
        a["personType"]="Student"
        a["homeAddress"] = "Cool Lane 12"
        #optional
        a["imgPath"] = "https://cdn3.volusion.com/kceqm.mleru/v/vspfiles/photos/74-2.jpg?1521734349"
        #Student elements
        a["nickName"] = "Lemony Snicket"
        a["classYear"] = "2020"
        a["major"] = "Major Lemon History"
        a["minor"] = "Minor Lemon History"
        #Faculty elements
        a["titles"] = ["True Lad", "Ultimate Lemon", "Potato Slayer"]  #array
        a["departments"] = ["CS", "Math"] #array
        a["spouse"] = "Limette"
        
        #SGA elements
        a["office_email"] = "lemons"
        a["office_phone"] = "+2037062953"
        a["office_addr"] = "mons"
        a["office_box"] = "ons"
        a["position_name"] = "ns"
        a["office_hours"] = ["1","2","3","4"] #array
    if(id==2):
        
        a["firstName"]="Magnifico Faculty"
        a["lastName"]="Lad"
        a["userName"]="Snickers"
        a["box"]="1010"
        a["email"] ="schildor@grinnell.edu"
        a["address"] = "Cool Street 11"
        a["phone"] = "+2037062953"
        a["personType"]="Faculty"
        a["homeAddress"] = "Cool Lane 12"
        #optional
        a["imgPath"] = "https://cdn3.volusion.com/kceqm.mleru/v/vspfiles/photos/74-2.jpg?1521734349"
        #Student elements
        a["nickName"] = "Lemony Snicket"
        a["classYear"] = "2020"
        a["major"] = "Major Lemon History"
        a["minor"] = "Minor Lemon History"
        #Faculty elements
        a["titles"] = ["True Lad", "Ultimate Lemon", "Potato Slayer"]  #array
        a["departments"] = ["CS", "Math"] #array
        a["spouse"] = "Limette"
        
        #SGA elements
        a["office_email"] = "lemons"
        a["office_phone"] = "+2037062953"
        a["office_addr"] = "mons"
        a["office_box"] = "ons"
        a["position_name"] = "ns"
        a["office_hours"] = ["1","2","3","4"] #array
    return a


'''
    For Safekeeping of table code
'''
'''
def create_table(schema, table):
    conn_string = "host="+ creds.PGHOST +" port="+ "5432" +" dbname="+ creds.PGDATABASE +" user=" + creds.PGUSER \
    +" password="+ creds.PGPASSWORD
    conn=psycopg2.connect(conn_string)
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT) # Added
    print("Connected for table creation!")
    
    # Create a cursor object
    cursor = conn.cursor()
    sql_command = ("DROP TABLE IF EXISTS {0}.{1};").format(str(schema), str(table))
    print (sql_command)
    
    # Load the data
    cursor.execute(sql_command, ())
    sql_command = ("CREATE TABLE {0}.{1} (\n"+
                   "user_id SERIAL,\n"+
                   "LastName varchar(255),\n"+
                   "FirstName varchar(255),\n"+
                   "PRIMARY KEY (user_id));").format(str(schema), str(table))
                   print (sql_command)
                   cursor.execute(sql_command, ())
                   sql_command = ("""INSERT INTO {0}.{1} (LastName, FirstName)
                       VALUES ('Alfred', 'Willhelm'),
                       ('Steve', 'Willhelm');""").format(str(schema), str(table))
                   print (sql_command)
                   cursor.execute(sql_command, ())
                   conn.commit()
                   cursor.close()
                   conn.close()
'''
