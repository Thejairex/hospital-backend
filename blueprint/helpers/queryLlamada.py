from init import mysql
import time
class qLlamada:
    
    @classmethod
    def traer_ultima_llamada(self, id):
        try:  
            cur = mysql.connection.cursor()
            query = 'SELECT MAX(id_llamada) FROM `zona_llamada` WHERE id_zona = {}'.format(id)
            cur.execute(query)
            x = cur.fetchone()
            print(x[0])
            if x[0] != None:
                return x[0]
            else:
                return None
        except Exception as e:
            raise e

    @classmethod
    def traer_llamadas(self ,column, data):
        try:
            cur = mysql.connection.cursor()
            query = """SELECT l.*, p.nombre "nombre_paciente", p.apellido "apellido_paciente",z.id_zona , z.nombre "nombre_zona", z.numero "numero_zona" FROM `llamada` l
                    LEFT JOIN paciente p ON l.dni_paciente = p.dni_paciente
                    LEFT JOIN zona_llamada zl on l.id_llamada = zl.id_llamada
                    LEFT JOIN zona z ON zl.id_zona = z.id_zona"""
            if len(column) != 0 and len(data) != 0:
                query = query + ' WHERE '
                i = 0
                for x in column:
                    query = query + " '{}' = {} ".format(x,data[i])
                    i += 1
                    if i != len(column):
                         
                        query = query + ' and '
            cur.execute(query)
            
            return cur.fetchall()
        except Exception as e:
            raise e
        
    @classmethod
    def traer_una_llamada(self, id_llamada):
        try:
            cur = mysql.connection.cursor()
            query = """SELECT l.*, p.nombre "nombre_paciente", p.apellido "apellido_paciente",z.id_zona , z.nombre "nombre_zona", z.numero "numero_zona" FROM `llamada` l
                    LEFT JOIN paciente p ON l.dni_paciente = p.dni_paciente
                    LEFT JOIN zona_llamada zl on l.id_llamada = zl.id_llamada
                    LEFT JOIN zona z ON zl.id_zona = z.id_zona WHERE l.id_llamada = {}""".format(id_llamada)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e
        
    @classmethod
    def insertar_llamada(self,dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona):
        def hacer_relacion(id_zona):
            query = "SELECT MAX(id_llamada) FROM `llamada`"
            cur.execute(query)
            
            ultima_llamada = cur.fetchone()
            query = "INSERT INTO 'zona_llamada' VALUES(null,{},{})".format(id_zona,ultima_llamada[0])
            cur.execute(query)
            mysql.connection.commit()
            return True
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO `llamada`(`id_llamada`, `dni_paciente`, `tipo`, `fecha_hora_llamada`, `fecha_hora_atentido`, `origen_llamada`, `dni_enfermero`) VALUES (null,{},'{}','{}','{}','{}',(SELECT z.dni_enfermero FROM zona z WHERE z.id_zona = {}))""".format(dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona)
            cur.execute(query)
            mysql.connection.commit()
            time.sleep(1.2)
            return hacer_relacion(id_zona)
        except Exception as e:
            raise e
        
    @classmethod
    def editar_llamada(self, id,dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE llamada SET dni_paciente = {},
            tipo = '{}',
            fecha_hora_llamada = '{}',
            fecha_hora_atentido = {},
            origen_llamada = '{}',
            dni_enfermero = (SELECT z.dni_enfermero FROM zona z WHERE z.id_zona = {})
            WHERE id_llamada = {}""".format( dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona,id)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e