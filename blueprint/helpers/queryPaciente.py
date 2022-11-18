from init import mysql

class qPacientes:
    
    # Insertar un nuevo regristro a la tabla paciente
    @classmethod
    def insertar_paciente(self, dni,nombre, apellido, fecha_nac,sexo, telefono, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion, patologia, alergia):
        try:
            cur = mysql.connection.cursor()
            query = """INSERT INTO paciente(`dni_paciente`, `nombre`, `apellido`, `fecha_nac`, `sexo`, `telefono`, `fecha_hora_ingreso`, `fecha_hora_egreso`, `tipo_sangre`, `direccion`,`patologia`,`alergia`) VALUES ({},'{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')
            """.format(dni, nombre, apellido, fecha_nac, sexo, telefono, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion, patologia, alergia)
            cur.execute(query)
            
            # INSERT INTO `paciente`(`dni_paciente`, `nombre`, `apellido`, `fecha_nac`, `sexo`, `telefono`, `fecha_hora_ingreso`, `fecha_hora_egreso`, `tipo_sangre`, `direccion`) VALUES (91728332,'Carol','Dyer','1963-11-11','Femenino',5495841,'2022-11-16 02:06:40',null,'O','684-4 Rutrum Ave')
            
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
    def editar_paciente(self, dni, nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion, patologia, alergia):
        try:
            cur = mysql.connection.cursor()
            query = """UPDATE paciente SET nombre = '{}',
            apellido = '{}',
            fecha_nac = '{}',
            telefono = '{}',
            sexo = '{}', 
            fecha_hora_ingreso = '{}', 
            fecha_hora_egreso = '{}', 
            tipo_sangre = '{}',
            direccion = '{}',
            patologia = '{}',
            alergia = '{}'
            WHERE dni_paciente = {}""".format( nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion, patologia, alergia,dni)
            
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
                    query = query + " {} = '{}' ".format(x,data[i])
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
    
    @classmethod
    def traer_antecedentes(sefl, dni_paciente):
        
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM `antecedentes` WHERE id_antecedente = (SELECT MAX(id_antecedente) FROM `antecedentes` WHERE dni_paciente={})".format(dni_paciente)
            query = "SELECT * FROM `antecedentes` WHERE dni_paciente = {}".format(dni_paciente)
            cur.execute(query)
            
            y = cur.fetchone()
            if y != None:
                return {
                        'id_antecedente': y[0],
                        'dni_paciente': y[1],
                        'diagnostico': y[2],
                        'motivo': y[3],
                        'tratamiento': y[4],
                        'medicacion': y[5],
                        'fecha': y[6]
                        
                    }
            else: 
                None
        except Exception as e:
            raise e
        
    @classmethod
    def traer_sus_antecedentes(self, dni_paciente):
        def fun(y):
            return {
                    'id_antecedente': y[0],
                    'dni_paciente': y[1],
                    'diagnostico': y[2],
                    'motivo': y[3],
                    'tratamiento': y[4],
                    'medicacion': y[5],
                    'fecha': y[6]
                    
                }
        
        try:
            cur = mysql.connection.cursor()
            query = "SELECT * FROM `antecedentes` WHERE dni_paciente = {}".format(dni_paciente)
            
            cur.execute(query)
            x = cur.fetchall()
            
            if len(x) != 0:
                result = map(fun, x)
                return list(result)
            
            else:
                return None
        except Exception as e:
            raise e