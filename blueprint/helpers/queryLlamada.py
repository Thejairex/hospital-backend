from init import mysql

class qLlamada:
    
    @classmethod
    def traer_ultima_llamada(self):
        try:  
            cur = mysql.connection.cursor()
            query = 'SELECT MAX(id_llamada) FROM llamada'
            cur.execute(query)
            return cur.fetchone()
        
        except Exception as e:
            raise e