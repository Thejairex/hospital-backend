from init import mysql

class qZona:
    
    # Insertar un nuevo regristro a la tabla zona
    @classmethod
    def insertar_zona(self, nombre,numero, id_forma_llamada, dni_enfermero,dni_paciente, descripcion, estado):
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO `zona`(`id_zona`, `nombre`, `numero`, `id_forma_llamada`, `dni_enfermero`, `dni_paciente`, `descripcion`, `estado`) VALUES (null,'{}',{},{},{},{},'{}',{})""".format(nombre,numero, id_forma_llamada, dni_enfermero,dni_paciente, descripcion, estado)
            # INSERT INTO `zona`(`id_zona`, `nombre`, `numero`, `id_forma_llamada`, `dni_enfermero`, `id_llamada`, `descripcion`, `estado`) VALUES (null,'LOL',1,1,15752301,25,'LOLOLOLO',0)
            cur.execute(query)
            mysql.connection.commit()
            return True 
        except Exception as e:
            raise e
    
    # Edita un registro de una zona
    @classmethod
    def editar_zona(self,id, nombre, numero, id_forma_llamada, dni_enfermero, dni_paciente,descripcion, estado):
        try:
            cur = mysql.connection.cursor()
            query = "UPDATE zona SET nombre = '{}', numero = {}, id_forma_llamada = {}, dni_enfermero = {}, dni_paciente = {}, descripcion = '{}', estado = {}  WHERE id_zona = {}".format(id, nombre, numero, id_forma_llamada, dni_enfermero, dni_paciente,descripcion, estado)
            
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
    def traer_zonas(self, column, data):
        try:
            cur = mysql.connection.cursor()
            query = """SELECT z.*, p.nombre "nombre_paciente",p.apellido "apellido_paciente", e.nombre "nombre_enfermero", e.apellido "apellido_enfermero" FROM zona z LEFT JOIN enfermero e ON z.dni_enfermero = e.dni_enfermero LEFT JOIN paciente p ON z.dni_paciente = p.dni_paciente"""
            if len(column) != 0 and len(data) != 0:
                query = query + ' WHERE '
                i = 0
                for x in column:
                    query = query + " {} = {} ".format(x,data[i])
                    i += 1
                    if i != len(column):
                         
                        query = query + ' and '
            cur.execute(query)
            mysql.connection.commit()
            return cur.fetchall()
        except Exception as e:
            raise e
    
    # traer una zona
    @classmethod
    def traer_una_zona(self, id_zona):
        try:
            cur = mysql.connection.cursor()
            query = """SELECT z.*, p.nombre "nombre_paciente",p.apellido "apellido_paciente", e.nombre "nombre_enfermero", e.apellido "apellido_enfermero" FROM zona z LEFT JOIN enfermero e ON z.dni_enfermero = e.dni_enfermero LEFT JOIN paciente p ON z.dni_paciente = p.dni_paciente WHERE z.id_zona = {}""".format(id_zona)
            
            cur.execute(query)
            mysql.connection.commit()
            return cur.fetchone()
        except Exception as e:
            raise e