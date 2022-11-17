import json
import pymysql

from datetime import datetime
# database connection
connection = pymysql.connect(host="localhost", user="root", passwd="", database="hospital")
cursor = connection.cursor()
def current_time():
    now = datetime.now()
    return now.strftime("%Y/%m/%d %H:%M:%S")

traffic = json.load(open('sql/Importaciones/dataPaciente.json'))
columns = ['dni_paciente', 'nombre', 'apellido', 'fecha_nac', 'sexo', 'telefono', 'tipo_sangre', 'direccion']

for row in traffic:
    keys= tuple(row[c] for c in columns)
    cursor.execute("INSERT INTO paciente VALUES(%s,%s,%s,%s,%s,%s,'{}',null,%s,%s,null,null)".format(current_time()),keys)
    print(f'{row["nombre"]} data inserted Succefully')

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