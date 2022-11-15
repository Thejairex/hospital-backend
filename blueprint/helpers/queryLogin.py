from init import mysql
import time


class qUser():
    @classmethod
    def userLogin(self, username):
        cur=mysql.connection.cursor()
        query="SELECT * FROM usuario WHERE usuario='{}'".format(username)
        cur.execute(query)
        
        return cur.fetchone()
        
    @classmethod
    def userRegister(self, username, password, email, role):
        try:
            cur=mysql.connection.cursor()
            query="INSERT INTO usuario(id_usuario, usuario, contrasena, email, rol) VALUES (null,'{}','{}','{}','{}')".format(username,password, email, role)
            cur.execute(query)
            mysql.connection.commit()
            time.sleep(1.5)
            return self.userLogin(username)
        
        except Exception as e:
            error = (1062, "Duplicate entry '{}' for key 'email'".format(email))
            if str(error) == str(e):
                return None
            else: 
                raise e