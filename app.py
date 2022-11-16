from flask_testing import TestCase
from config import Config
from flask import Flask
from flask_mysqldb import MySQL
from flask_jwt_extended import JWTManager

from init import mysql 

from blueprint.loginApi import loginApi
from blueprint.zonaApi import zonaApi

app = Flask(__name__, static_folder='../static', template_folder='../templates')
MySQL(app)

app.config["JWT_SECRET_KEY"] = Config.MY_SECRET_JWT
app.config['MYSQL_HOST'] = Config.MYSQL_HOST_DEV
app.config['MYSQL_USER'] = Config.MYSQL_USER_DEV
app.config['MYSQL_PASSWORD'] = Config.MYSQL_PASSWORD_DEV
app.config['MYSQL_DB'] = Config.MYSQL_DB_DEV

jwt = JWTManager(app)

app.register_blueprint(zonaApi)
app.register_blueprint(loginApi)

if __name__ == '__main__':
    app.run(debug=Config.DEBUG)
