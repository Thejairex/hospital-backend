from flask import Flask
from flask_jwt_extended import  JWTManager
from flask_mysqldb import MySQL

app = Flask(__name__)
jwt = JWTManager(app)
mysql = MySQL(app)