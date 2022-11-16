import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    DEBUG = True

    TEMPLATE_FOLDER = '/templates'
    STATIC_FOLDER = '/static'
    
    SECRET_KEY = '3a2ede8fa3c3a9e68d03d5ea9a026a8dc37ae9bf400c1dfbf218f62c8031cabf'
    
    MYSQL_HOST_DEV = "localhost"
    MYSQL_USER_DEV = "root"
    MYSQL_PASSWORD_DEV = ""
    MYSQL_DB_DEV = "hospital"
    
    MYSQL_HOST = 'HospitalBackend.mysql.pythonanywhere-services.com'
    MYSQL_USER = 'HospitalBackend'
    MYSQL_PASSWORD = 'aiwa2015'
    MYSQL_DB = 'HospitalBackend$hospital'

    MY_SECRET_JWT = os.environ.get("MY_SECRET_JWT", "")


    
    