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
            
    @classmethod
    def traer_usuarios(self):
        try:
            cur=mysql.connection.cursor()
            query="SELECT * FROM usuario"
            cur.execute(query)
            mysql.connection.commit()
            return cur.fetchall()
        except Exception as e:
            raise e
        
    @classmethod
    def traer_un_usuarios(self,id):
        try:
            cur=mysql.connection.cursor()
            query="SELECT * FROM usuario WHERE id_usuario = {}".format(id)
            cur.execute(query)
            mysql.connection.commit()
            return cur.fetchone()
        except Exception as e:
            raise e
        
    @classmethod
    def editar_usuario(self,id, username, password, email, role):
        try:
            cur=mysql.connection.cursor()
            query="""UPDATE usuario SET 
            usuario = '{}',
            contrasena = '{}',
            email = '{}',
            rol = {} WHERE id_usuario = {}""".format(username,password, email, role, id)
            cur.execute(query)
            mysql.connection.commit()
        
        except Exception as e:
            error = (1062, "Duplicate entry '{}' for key 'email'".format(email))
            if str(error) == str(e):
                return None
            else: 
                raise e
        