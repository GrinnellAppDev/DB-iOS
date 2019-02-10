import json

from flask import Flask

from flask import request
from flask import Response

app = Flask(__name__)

@app.route("/")

def hello():
    
    
    b = list()
    b.append(populate())
    b.append(populate(id=1))
    
    return Response(json.dumps(b), mimetype='json/application')

def populate(id=0):
    user = request.args.get('lastName')
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

    return a
