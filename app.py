# Import libraries

from flask import Flask
from flask_mysqldb import MySQL
from flask_jwt_extended import JWTManager

# Import moduls
from config import Config
from blueprint.llamadaApi import llamadaApi
from blueprint.loginApi import loginApi
from blueprint.zonaApi import zonaApi
from blueprint.enfermeroApi import enfermeroApi
from blueprint.pacienteApi import pacienteApi

# Init app
app = Flask(__name__, static_folder='../static', template_folder='../templates')
MySQL(app)

# Init Json Web Token
jwt = JWTManager(app)

# Config connections
app.config["JWT_SECRET_KEY"] = '3a2ede8fa3c3a9e68d03d5ea9a026a8dc37ae9bf400c1dfbf218f62c8031cabf'
app.config['MYSQL_HOST'] = Config.MYSQL_HOST
app.config['MYSQL_USER'] = Config.MYSQL_USER
app.config['MYSQL_PASSWORD'] = Config.MYSQL_PASSWORD
app.config['MYSQL_DB'] = Config.MYSQL_DB

# Import blueprint to app
app.register_blueprint(llamadaApi)
app.register_blueprint(enfermeroApi)
app.register_blueprint(pacienteApi)
app.register_blueprint(zonaApi)
app.register_blueprint(loginApi)

if __name__ == '__main__':
    app.run(debug=Config.DEBUG)
