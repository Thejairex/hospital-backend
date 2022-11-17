from init import mysql

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
            query = """SELECT l.*, p.nombre "nombre_paciente", p.apellido "apellido_paciente", z.nombre "nombre_zona", z.numero "numero_zona" FROM `llamada` l
                INNER JOIN paciente p ON l.dni_paciente = p.dni_paciente
                INNER JOIN zona z ON l.id_zona = z.id_zona"""
            if len(column) != 0 and len(data) != 0:
                query = query + ' WHERE '
                i = 0
                for x in column:
                    query = query + " {} = {} ".format(x,data[i])
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
            query = """SELECT l.*, p.nombre "nombre_paciente", p.apellido "apellido_paciente", z.nombre "nombre_zona", z.numero "numero_zona" FROM `llamada` l
                INNER JOIN paciente p ON l.dni_paciente = p.dni_paciente
                INNER JOIN zona z ON l.id_zona = z.id_zona WHERE id_llamada = {}""".format(id_llamada)
            
            cur.execute(query)
            
            return cur.fetchone()
        except Exception as e:
            raise e
        
    @classmethod
    def insertar_llamada(self,dni_paciente, id_zona, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada):
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO llamada(dni_paciente, id_zona, tipo, fecha_hora_llamada, fecha_hora_atentido, origen_llamada) VALUES ({},{},'{}','{}',{},'{}')""".format(dni_paciente, id_zona, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada)
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e
        
    @classmethod
    def editar_llamada(self, id,dni_paciente, id_zona, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE llamada SET dni_paciente = {},
            id_zona = {},
            tipo = '{}',
            fecha_hora_llamada = '{}',
            fecha_hora_atentido = {},
            origen_llamada = '{}'
            WHERE id_llamada = {}""".format( dni_paciente, id_zona, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada,id)
            
            cur.execute(query)
            mysql.connection.commit()
            return True
        except Exception as e:
            raise e