import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    SERVER_NAME = "localhost:5000"
    DEBUG = True

    TEMPLATE_FOLDER = '/templates'
    STATIC_FOLDER = '/static'

    MYSQL_HOST_DEV = "localhost"
    MYSQL_USER_DEV = "root"
    MYSQL_PASSWORD_DEV = ""
    MYSQL_DB_DEV = "testing"

    MYSQL_HOST = 'Thejairex2.mysql.pythonanywhere-services.com'
    MYSQL_USER = 'Thejairex2'
    MYSQL_PASSWORD = 'Aiwa2015'
    MYSQL_DB = 'Thejairex2$biblioteca'

    MY_SECRET = os.environ.get("MY_SECRET", "")


    
    