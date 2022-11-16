from init import mysql

class qPacientes:
    
    # Insertar un nuevo regristro a la tabla paciente
    @classmethod
    def insertar_paciente(self, dni, nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre):
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO paciente VALUES(
                {}, '{}', '{}', {},'{}', '{}' , '{}', '{}', '{}')
            """.format(dni, nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre)
            cur.execute(query)
            mysql.connection.commit()
            return True 
        except Exception as e:
            error = (1062, "Duplicate entry '{}' for key 'PRIMARY'".format(dni))
            if str(error) == str(e):
                return None
            else: 
                raise e
    
    # Edita un registro de paciente
    @classmethod
    def editar_paciente(self, dni, nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE paciente SET nombre = '{}',
            apellido = '{}',
            fecha_nac = '{}',
            telefono = {},
            sexo = '{}', 
            fecha_hora_ingreso = '{}', 
            fecha_hora_egreso = '{}', 
            tipo_sangre = '{}' 
            WHERE dni_paciente = {}""".format( nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre,dni)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e 
            
    
    # borra un registro de paciente
    @classmethod
    def borrar_paciente(self, dni):
        try:
            cur = mysql.connection.cursor()
            query = "DELETE FROM paciente WHERE dni_paciente = {}".format(dni)
            
            cur.execute(query)
            mysql.connection.commit()
            return {'msg': 'Se ha borrado la paciente correctamente.'} 
        except Exception as e:
            raise e
    
    # traer todos los registros de pacientes
    @classmethod
    def traer_pacientes(self,colum,data):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM paciente"
            if len(colum) != 0 and len(data) != 0:
                query = query + ' WHERE '
                i = 0
                for x in colum:
                    query = query + " {} = {} ".format(x,data[i])
                    i += 1
                    if i != len(colum):
                         
                        query = query + ' and '
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e
    
    # traer un registro de paciente
    @classmethod
    def trar_un_paciente(self, dni_paciente):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM paciente WHERE dni_paciente = {}".format(dni_paciente)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e
        