import json
import pymysql

from datetime import datetime
# database connection
connection = pymysql.connect(host="localhost", user="root", passwd="", database="hospital")
cursor = connection.cursor()
def current_time():
    now = datetime.now()
    return now.strftime("%Y/%m/%d %H:%M:%S")

traffic = json.load(open('sql/Importaciones/dataLlamada.json'))
columns = ['id_llamada', 'tipo', 'origen_llamada']

def fetch_paciente(i):
    x = cursor.execute('SELECT dni_paciente FROM paciente')
    x = cursor.fetchall()
    
    for y in x[i]:
        return y
    
def fetch_enfermero(i):
    x = cursor.execute('SELECT dni_enfermero FROM enfermero')
    x = cursor.fetchall()
   
    for y in x[i]:
        return y
i = 0
for row in traffic:
    keys= tuple(row[c] for c in columns)
    cursor.execute("INSERT INTO llamada VALUES(%s,{},%s,'{}',null,%s,{})".format(fetch_paciente(i),current_time(),fetch_enfermero(i)),keys)
    print(f'{row["id_llamada"]} data inserted Succefully')
    i+=1

connection.commit()
connection.close()

""" connection = sqlite3.connect('empresa.db')
cursor = connection.cursor()

traffic = json.load(open('users_data.json'))
columns = ['idEmp','nombre','cargo','edad','email','telefono','codDepto']
for row in traffic:
    keys= tuple(row[c] for c in columns)
    cursor.execute('insert into empleado values(?,?,?,?,?,?,?)',keys)
    print(f'{row["nombre"]} data inserted Succefully')

connection.commit()
connection.close() """