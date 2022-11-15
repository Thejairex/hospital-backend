from init import mysql

class query():
    
    @classmethod
    def qAll(self, tabla):
        cur = mysql.connection.cursor()
        query = 'SELECT * FROM {}'.format(tabla)
        cur.execute(query)
        return cur.fetchall()
    
    @classmethod
    def qPaciente(self):
        cur = mysql.connection.cursor()
        query = 'SELECT dni_paciente FROM paciente'
        cur.execute(query)
        return cur.fetchall()
    
    @classmethod
    def qEnfermero(self):
        cur = mysql.connection.cursor()
        query = 'SELECT dni_enfermero FROM enfermero'
        cur.execute(query)
        return cur.fetchall()
    
    @classmethod
    def qFormaLLamada(self):
        cur = mysql.connection.cursor()
        query = 'SELECT id_forma_llamada FROM forma_llamada'
        cur.execute(query)
        return cur.fetchall()