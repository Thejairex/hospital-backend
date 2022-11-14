from init import mysql

class query():
    
    @classmethod
    def qAll(self, tabla):
        cur = mysql.connection.cursor()
        query = 'SELECT * FROM {}'.format(tabla)
        cur.execute(query)
        return cur.fetchall()