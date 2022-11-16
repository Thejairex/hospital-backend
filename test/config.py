import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    SERVER_NAME = "localhost:5000"
    DEBUG = True

    TEMPLATE_FOLDER = '/templates'
    STATIC_FOLDER = '/static'

    MYSQL_HOST_DEV = os.environ.get("MYSQL_HOST", "")
    MYSQL_USER_DEV = os.environ.get("MYSQL_USER", "")
    MYSQL_PASSWORD_DEV = os.environ.get("MYSQL_PASSWORD", "")
    MYSQL_DB_DEV = os.environ.get("MYSQL_DB", "")

    MYSQL_HOST = 'Thejairex2.mysql.pythonanywhere-services.com'
    MYSQL_USER = 'Thejairex2'
    MYSQL_PASSWORD = 'Aiwa2015'
    MYSQL_DB = 'Thejairex2$biblioteca'

    MY_SECRET = os.environ.get("MY_SECRET", "")
    MY_SECRET_JWT = os.environ.get("MY_SECRET_JWT", "")


    
    