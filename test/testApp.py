from flask_testing import TestCase
from config import Config
from flask import Flask
from flask_mysqldb import MySQL
from flask_jwt_extended import JWTManager

from blueprint.loginApi import loginApi

from blueprint.helpers.querys_test import query

class MyTest(TestCase):
    
    
    def create_app(self):
        app = Flask(__name__, static_folder='../static', template_folder='../templates')
        MySQL(app)
        
        app.config["JWT_SECRET_KEY"] = Config.MY_SECRET_JWT
        app.config['MYSQL_HOST'] = Config.MYSQL_HOST_DEV
        app.config['MYSQL_USER'] = Config.MYSQL_USER_DEV
        app.config['MYSQL_PASSWORD'] = Config.MYSQL_PASSWORD_DEV
        app.config['MYSQL_DB'] = Config.MYSQL_DB_DEV

        jwt = JWTManager(app)

        app.register_blueprint(loginApi)
        return app
    
    
    def test_all_tables_success(self):
        tablas = ['alergias','antecedentes','enfermero','forma_llamada','llamada','paciente','patologia','usuario','zona']
        for tabla in tablas:
            result = query.qAll(tabla)
            assert result == () or len(result) != 0
        
    def test_access_user_sucess(self):
        response = self.client.post('/api/login', json={
            'username': 'jair',
            'password': '123123123'
        })
        assert response.status_code == 200

    def test_register_user_success(self):
        response = self.client.post('/api/signup', json={
            'username': 'jair',
            'password': '123123123',
            'email': 'jair@gmail.com'
        })
        assert response.status_code == 200
        
        
if __name__ == '__main__':
    app = MyTest.create_test_app()
    
    
    app.run(debug = Config.DEBUG)