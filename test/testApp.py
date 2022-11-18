from flask_testing import TestCase
from config import Config
from flask import Flask
from flask_mysqldb import MySQL
from flask_jwt_extended import JWTManager
from datetime import datetime

from blueprint.loginApi import loginApi
from blueprint.zonaApi import zonaApi
from blueprint.pacienteApi import pacienteApi
from blueprint.enfermeroApi import enfermeroApi
from blueprint.llamadaApi import llamadaApi

from blueprint.helpers.querys_test import query
from blueprint.helpers.queryLlamada import qLlamada
class MyTest(TestCase):
    
    # Inicializa la aplicacion
    def create_app(self):
        app = Flask(__name__, static_folder='../static', template_folder='../templates')
        MySQL(app)
        
        app.config["JWT_SECRET_KEY"] = Config.MY_SECRET_JWT
        app.config['MYSQL_HOST'] = Config.MYSQL_HOST_DEV
        app.config['MYSQL_USER'] = Config.MYSQL_USER_DEV
        app.config['MYSQL_PASSWORD'] = Config.MYSQL_PASSWORD_DEV
        app.config['MYSQL_DB'] = Config.MYSQL_DB_DEV
        app.config['SECRET_KEY'] = Config.MY_SECRET

        jwt = JWTManager(app)

        app.register_blueprint(llamadaApi)
        app.register_blueprint(enfermeroApi)
        app.register_blueprint(pacienteApi)
        app.register_blueprint(zonaApi)
        app.register_blueprint(loginApi)
        return app
    
    # Testea que todas las tablas existan
    def test_all_tables_success(self):
        tablas = ['antecedentes','enfermero','forma_llamada','llamada','paciente','usuario','zona']
        for tabla in tablas:
            result = query.qAll(tabla)
            assert result == () or len(result) != 0
    
    # Testea el login al usuario
    def test_access_user_sucess(self):
        response = self.client.post('/api/login', json={
            'username': 'jair',
            'password': '123123123'
        })
        assert response.status_code == 200
    
    # testea el Json Web Token con el registro
    def test_jwt_cookie_success(self):
        response = self.client.post('/api/login', json={
            'username': 'pete',
            'password': '123123123'
        })
        
        self.client.set_cookie('localhost', 'accessToken', response.get_json()['accessToken'])
        response2 = self.client.post('/api/signup', json={
            'username': 'TikkiX2',
            'password': '1234',
            'email': 'efrainrg@gmail.com',
            'role:': 1
        }, headers=response.headers)
        assert response2.status_code == 200 or response2.status_code == 403
        
    # Testea todos los procesos de zonaApi
    def test_zona_process_sucess(self):
        
        
        todas_zonas = self.client.get('/api/zonas')
        
        user = self.client.post('/api/login', json={
            'username': 'pete',
            'password': '123123123'
        })
        
        self.client.set_cookie('localhost', 'accessToken', user.get_json()['accessToken'])
        # borrar_zona = self.client.delete('/api/zona/20', headers = user.headers)
        traer_una_zona = self.client.get('/api/zonas/4')
        # editar_zona = self.client.post('/api/zonas/1', json=traer_una_zona.get_json() ,headers = user.headers)
        
        id_forma_llamada = [x[0] for x in query.qFormaLLamada()]
        dni_enfermero = [x[0] for x in query.qEnfermero()]
        
        agregar_zona = self.client.post('/api/zonas', json={
            'nombre': 'Quirofano',
            'numero': 5,
            'id_forma_llamada': 1,
            'dni_enfermero': dni_enfermero[0],
            'id_llamada': 25,
            'descripcion': 'f',
            'estado': 0
            },headers = user.headers)
        
        # assert todas_zonas.status_code == 200
        # assert borrar_zona.status_code == 200
        # assert traer_una_zona.status_code == 200
        # assert editar_zona.status_code == 200
        # assert agregar_zona.status_code == 200
    
    # Testing todos los procesos de paciente
    def test_paciente_proccess_success(self):
        todos_pacientes = self.client.get('/api/pacientes')
        assert todos_pacientes.status_code == 200
        
        user = self.client.post('/api/login', json={
            'username': 'pete',
            'password': '123123123'
        })
        
        self.client.set_cookie('localhost', 'accessToken', user.get_json()['accessToken'])
        un_paciente = self.client.get('/api/pacientes/0')
        assert un_paciente.status_code == 200 or un_paciente.status == '404 NOT FOUND'
        
        # borrar_paciente = self.client.delete('/api/pacientes/18316403')
        # assert borrar_paciente.status_code == 200
        insertar_paciente = self.client.post('/api/pacientes', json={
            "dni_paciente": 91728333,
            "nombre": "Aquila",
            "apellido": "Cox",
            "fecha_nac": "1982-02-06",
            "telefono": 5290770,
            "sexo": "Femenino",
            "fecha_hora_ingreso": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "fecha_hora_egreso": 'null',
            "tipo_sangre": "AB",
            "direccion": 'Alejo Bruix 5455'
        })
        assert insertar_paciente.status_code == 200
        
        # editar_paciente = self.client.post('/api/pacientes/30432182', json={
        #     "nombre": "Aquila",
        #     "apellido": "Cojo",
        #     "fecha_nac": "1982-02-06",
        #     "telefono": 5290770,
        #     "sexo": "Femenino",
        #     "fecha_hora_ingreso": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        #     "fecha_hora_egreso": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        #     "tipo_sangre": "A"
        # })
        
        # assert editar_paciente.status_code == (200 or None)
        
    def test_enfermero_process_success(self):
        todos_enfermero = self.client.get('/api/enfermeros')
        assert todos_enfermero.status_code == 200
        
        user = self.client.post('/api/login', json={
            'username': 'pete',
            'password': '123123123'
        })
        
        self.client.set_cookie('localhost', 'accessToken', user.get_json()['accessToken'])
        un_enfermero = self.client.get('/api/enfermero/19368052')
        assert un_enfermero.status_code == 200 or un_enfermero.status == '404 NOT FOUND'
        
        borrar_paciente = self.client.delete('/api/enfermeros/19368052')
        assert borrar_paciente.status_code == 200
        
        insertar_enfermero = self.client.post('/api/enfermeros', json={
            "dni_enfermero": 250583972,
            "nombre": "Abbot",
            "apellido": "Rollins",
            "sexo": "Masculino",
            "telefono": 2835147,
            'fecha_nac': "2010-9-27",
            'estado': 0,
        })
        assert insertar_enfermero.status_code == (200 or None)
        
        # editar_paciente = self.client.post('/api/enfermeros/250583972', json={
        #     "dni_enfermero": 250583972,
        #     "nombre": "Abbot1",
        #     "apellido": "Rollins2",
        #     "sexo": "Masculino",
        #     "telefono": 2835147,
        #     'fecha_nac': "2010-9-27",
        #     'estado': 0,
        # })
        
        # assert editar_paciente.status_code == (200 or None)
        
    # Testing llamada
    def test_llamada_process_success(self):
        user = self.client.post('/api/login', json={
            'username': 'pete',
            'password': '123123123'
        })
        
        self.client.set_cookie('localhost', 'accessToken', user.get_json()['accessToken'])
        traer_llamadas = self.client.get('/api/llamadas')
        assert traer_llamadas.status_code == 200
        
        dniPaciente = [x[0] for x in query.qPaciente()]
        id_zona = [x[0] for x in query.qZona()]
        dniEnfermero = [x[0] for x in query.qEnfermero()]
        
        insertar_llamada = self.client.post('/api/llamadas', json ={
            'dni_paciente': dniPaciente[1],
            'id_zona': id_zona[-1],
            'tipo': 'Emergencia',
            'fecha_hora_llamada': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            'fecha_hora_atentido': 'null',
            'origen_llamada': 'nodo',
            'dniEnfermero': dniEnfermero[1]
        })
        
        assert insertar_llamada.status_code == 200
        
        traer_una_llamada = self.client.get('/api/llamadas/57')
        assert traer_una_llamada.status_code == 200
        
        editar_llamada = self.client.post('/api/llamadas/58', json={
            'dni_paciente': dniPaciente[3],
            'id_zona': id_zona[-1],
            'tipo': 'normal',
            'fecha_hora_llamada': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            'fecha_hora_atentido': 'null',
            'origen_llamada': 'cama',
            'dniEnfermero': dniEnfermero[1]
            
        })
        
        assert editar_llamada.status_code == 200
        
if __name__ == '__main__':
    app = MyTest.create_app()
    
    
    app.run(debug = Config.DEBUG)