import json

from flask import Flask

from flask import request

app = Flask(__name__)

@app.route("/")

def hello():
    user = request.args.get('name')
    a = dict()
    a["name"]="Lad"
    a["age"]=request.args.get('age')
    a["major"]=[1,2,3,4]
    if user == "Lad":
        return json.dumps(a)
    else:
        return "who"
