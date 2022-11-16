from init import mysql

class qEnfermero:
    
    # traer todos los registros de enfermeros
    @classmethod
    def traer_enfermeros(self, colum,data):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM enfermero"
            if len(colum) != 0 and len(data) != 0:
                query = query + ' WHERE '
                i = 0
                for x in colum:
                    query = query + " {} = '{}' ".format(x,data[i])
                    i += 1
                    if i != len(colum):
                         
                        query = query + ' and '
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e
    
    # traer un registro de enfermero
    @classmethod
    def trar_un_enfermero(self, dni_enfermero):
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM enfermero WHERE dni_enfermero = {}".format(dni_enfermero)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e
    
    # Insertar un nuevo regristro a la tabla enfermero
    @classmethod
    def insertar_enfermero(self, dni,nombre, apellido,sexo, telefono ):
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO enfermero VALUES(
                {}, '{}', '{}', '{}', {})
            """.format(dni,nombre, apellido,sexo, telefono )
            cur.execute(query)
            mysql.connection.commit()
            return True 
        except Exception as e:
            error = (1062, "Duplicate entry '{}' for key 'PRIMARY'".format(dni))
            if str(error) == str(e):
                return None
            else: 
                raise e
    
    # Edita un registro de enfermero
    @classmethod
    def editar_enfermero(self, dni,nombre, apellido,sexo, telefono ):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE enfermero SET nombre = '{}',
            apellido = '{}',
            sexo = '{}', 
            telefono = {} 
            WHERE dni_enfermero = {}""".format( nombre, apellido,sexo, telefono, dni)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e 
            
    
    # borra un registro de enfermero
    @classmethod
    def borrar_enfermero(self, dni):
        try:
            cur = mysql.connection.cursor()
            query = "DELETE FROM enfermero WHERE dni_enfermero = {}".format(dni)
            
            cur.execute(query)
            mysql.connection.commit()
            return {'msg': 'Se ha borrado la enfermero correctamente.'} 
        except Exception as e:
            raise e
    
    
        