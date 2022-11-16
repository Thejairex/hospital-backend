from init import mysql

class qZona:
    
    # Insertar un nuevo regristro a la tabla zona
    @classmethod
    def insertar_zona(self, nombre, numero, id_forma_llamada, dni_paciente, dni_enfermero):
        try:
            cur = mysql.connection.cursor()
            query = "INSERT INTO zona VALUES(null, '{}', {}, {}, {}, {})".format(nombre, numero, id_forma_llamada, dni_paciente, dni_enfermero)
            
            cur.execute(query)
            mysql.connection.commit()
            return True 
        except Exception as e:
            raise e
    
    # Edita un registro de una zona
    @classmethod
    def editar_zona(self, id_zona, nombre, numero, id_forma_llamada, dni_paciente, dni_enfermero, id_llamada, descripcion):
        try:
            cur = mysql.connection.cursor()
            query = "UPDATE zona SET nombre = '{}', numero = {}, id_forma_llamada = {}, dni_paciente = {}, dni_enfermero = {}, id_llamada = {}, descripcion = '{}'  WHERE id_zona = {}".format(nombre, numero, id_forma_llamada, dni_paciente, dni_enfermero, id_zona, id_llamada, descripcion)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e 
            
    
    # borra un registro de zona
    @classmethod
    def borrar_zona(self, id_zona):
        try:
            cur = mysql.connection.cursor()
            query = "DELETE FROM zona WHERE id_zona = {}".format(id_zona)
            
            cur.execute(query)
            mysql.connection.commit()
            return {'msg': 'Se ha borrado la zona correctamente.'} 
        except Exception as e:
            raise e
    
    # traer todas las zonas
    @classmethod
    def traer_zonas(self):
        try:
            cur = mysql.connection.cursor()
            query = """SELECT z.*, p.nombre "nombre_paciente", p.apellido "apellido_paciente", e.nombre "nombre_enfermero", e.apellido "apellido_enfermero", l.id_llamada FROM `zona`  z
                INNER JOIN paciente p ON  z.dni_paciente = p.dni_paciente
                INNER JOIN enfermero e ON  z.dni_enfermero = e.dni_enfermero
                INNER JOIN llamada l on z.id_llamada = l.id_llamada"""
            
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e
    
    # traer una zona
    @classmethod
    def traer_una_zona(self, id_zona):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM zona WHERE id_zona = {}".format(id_zona)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e