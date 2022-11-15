import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    DEBUG = False

    TEMPLATE_FOLDER = '/templates'
    STATIC_FOLDER = '/static'
    
    MYSQL_HOST_DEV = "localhost"
    MYSQL_USER_DEV = "root"
    MYSQL_PASSWORD_DEV = ""
    MYSQL_DB_DEV = "hospital"
    
    MYSQL_HOST = os.environ.get("MYSQL_HOST", "")
    MYSQL_USER = os.environ.get("MYSQL_USER", "")
    MYSQL_PASSWORD = os.environ.get("MYSQL_PASSWORD", "")
    MYSQL_DB = os.environ.get("MYSQL_DB", "")

    MY_SECRET_JWT = os.environ.get("MY_SECRET_JWT", "")


    
    