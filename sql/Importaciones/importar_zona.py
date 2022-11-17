import json
import pymysql

# database connection
connection = pymysql.connect(host="localhost", user="root", passwd="", database="hospital")
cursor = connection.cursor()

traffic = json.load(open('sql/Importaciones/dataZona.json'))
columns = ['id_zona','nombre', 'numero','descripcion','estado']

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
    
def fetch_llamada(i):
    x = cursor.execute('SELECT id_llamada FROM llamada')
    x = cursor.fetchall()

    for y in x[i]:
        print(y)
        return y

i = 0
for row in traffic:
    keys= tuple(row[c] for c in columns)
    cursor.execute('INSERT INTO zona(id_zona,nombre, numero, id_forma_llamada, dni_enfermero, dni_paciente, descripcion,estado) VALUES(%s, %s, %s, 1, {}, null, %s,%s)'.format(fetch_enfermero(i), fetch_paciente(i)),keys)
    print(f'{row["nombre"]} data inserted Succefully')
    i +=1 

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