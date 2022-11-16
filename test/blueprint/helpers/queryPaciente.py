from init import mysql

class qPacientes:
    
    # Insertar un nuevo regristro a la tabla paciente
    @classmethod
    def insertar_paciente(self, nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre):
        try:
            cur = mysql.connection.cursor()
            query = "INSERT INTO zona VALUES(null, '{}', {}, {}, {}, {})".format(nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre)
            cur.execute(query)
            mysql.connection.commit()
            return True 
        except Exception as e:
            raise e
    
    # Edita un registro de paciente
    @classmethod
    def editar_paciente(self, dni, nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE zona SET nombre = '{}',
            nombre = {},
            apellido = {},
            fecha_nac = {},
            sexo = {}, 
            fecha_hora_ingreso = {}, 
            fecha_hora_egreso = {}, 
            tipo_sangre = {}  
            WHERE dni_paciente = {}""".format(nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, dni)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e 
            
    
    # borra un registro de paciente
    @classmethod
    def borrar_paciente(self, id_zona):
        try:
            cur = mysql.connection.cursor()
            query = "DELETE FROM zona WHERE id_zona = {}".format(id_zona)
            
            cur.execute(query)
            mysql.connection.commit()
            return {'msg': 'Se ha borrado la zona correctamente.'} 
        except Exception as e:
            raise e
    
    # traer todos los registros de pacientes
    @classmethod
    def traer_pacientes(self):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM paciente"
            
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e
    
    # traer un registro de paciente
    @classmethod
    def trar_un_paciente(self, dni_paciente):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM zona WHERE dni_paciente = {}".format(dni_paciente)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e
        
    @classmethod
    def traer_pacientes(self):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM paciente WHERE {} = {}"
            
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e