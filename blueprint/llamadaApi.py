# Import libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

# Import Moduls
from blueprint.helpers.queryLlamada import qLlamada


# Init blueprint
llamadaApi = Blueprint('llamadaApi', __name__, template_folder='app/templates')

# Routes of Llamadas Api

# Routes general
@llamadaApi.route('/api/llamadas', methods = ['GET','POST'])
def pacientes():
    
    # Fecht all llamada
    if request.method == 'GET':
        
        colum = []
        data = []
        jsonPaciente = []
        
        for x in request.args:
            colum.append(x)
            data.append(request.args.get(x))
        dataLlamada = qLlamada.traer_llamadas(colum,data)
        
        
        
        for data in dataLlamada:
            jsonPaciente.append({
                'id_llamada': data[0],
                'dni_paciente': data[1],
                'tipo': data[2],
                'fecha_hora_llamada': data[3],
                'fecha_hora_atentido': data[4],
                'origen_llamada': data[5],
                'dni_enfermero': data[6],
                'nombre_paciente': data[7],
                'apellido_paciente': data[8],
                'id_zona': data[9],
                'nombre_zona': data[10],
                'numero_zona': data[11]
                
            })
            
        return jsonify(jsonPaciente), 200
    
    # Insert new llamada
    if request.method == 'POST':
        dni_paciente = request.json.get('dni_paciente', None)
        tipo = request.json.get('tipo', None)
        fecha_hora_llamada = request.json.get('fecha_hora_llamada', None)
        fecha_hora_atentido = request.json.get('fecha_hora_atentido', 'null')
        origen_llamada = request.json.get('origen_llamada', None)
        id_zona = request.json.get('id_zona', None)
        
        return jsonify(qLlamada.insertar_llamada(dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona)), 200

# Route protected
@llamadaApi.route('/api/llamadas/<id>', methods=['POST','GET','DELETE'])
@jwt_required(locations=['cookies','headers'])
def zona(id):
    
    # Fetch one llamada
    if request.method == 'GET':
        data = qLlamada.traer_una_llamada(id)
        if data != None:
            return jsonify({
                    'id_llamada': data[0],
                    'dni_paciente': data[1],
                    'tipo': data[2],
                    'fecha_hora_llamada': data[3],
                    'fecha_hora_atentido': data[4],
                    'origen_llamada': data[5],
                    'dni_enfermero': data[6],
                    'nombre_paciente': data[7],
                    'apellido_paciente': data[8],
                    'id_zona': data[9],
                    'nombre_zona': data[10],
                    'numero_zona': data[11]
                }), 200
        else:
            return jsonify({
                'msg': 'Not Found'
            }) ,404
    
    # verifies the role is administrador
    if get_jwt_identity()['role'] == 'administrador':
    
        # Edit one llamada
        if request.method == 'POST':
            dni_paciente = request.json.get('dni_paciente', None)
            tipo = request.json.get('tipo', None)
            fecha_hora_llamada = request.json.get('fecha_hora_llamada', None)
            fecha_hora_atentido = request.json.get('fecha_hora_atentido', 'null')
            origen_llamada = request.json.get('origen_llamada', None)
            id_zona = request.json.get('id_zona', None)
            
            return jsonify(qLlamada.editar_llamada(id ,dni_paciente, tipo,fecha_hora_llamada, fecha_hora_atentido, origen_llamada, id_zona)), 200
        
        
    else:
        return jsonify({'msg': 'No autorizado'}), 403
    