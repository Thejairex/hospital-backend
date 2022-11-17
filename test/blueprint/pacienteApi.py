# Libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

from blueprint.helpers.queryPaciente import qPacientes

pacienteApi = Blueprint('pacienteApi', __name__, template_folder='app/templates')

@pacienteApi.route('/api/pacientes', methods = ['GET','POST'])
def pacientes():
    if request.method == 'GET':
        
        colum = []
        data = []
        for x in request.args:
            colum.append(x)
            data.append(request.args.get(x))
        dataPacientes = qPacientes.traer_pacientes(colum,data)
        
        jsonPaciente = []
        
        for data in dataPacientes:
            jsonPaciente.append({
                'dni_paciente': data[0],
                'nombre': data[1],
                'apellido': data[2],
                'fecha_nac': data[3],
                'sexo': data[4],
                'telefono': data[5],
                'fecha_hora_ingreso': data[6],
                'fecha_hora_egreso': data[7],
                'tipo_sangre': data[8],
                'direccion': data[9]
            })
            
        return jsonify(jsonPaciente), 200
    
    if request.method == 'POST':
        dni = request.json.get('dni_paciente',None)
        nombre = request.json.get('nombre', None)
        apellido = request.json.get('apellido', None)
        fecha_nac = request.json.get('fecha_nac', None)
        telefono = request.json.get('telefono', None)
        sexo = request.json.get('sexo', None)
        fecha_hora_ingreso = request.json.get('fecha_hora_ingreso', None)
        fecha_hora_egreso = request.json.get('fecha_hora_egreso', 'null')
        tipo_sangre = request.json.get('tipo_sangre', None)
        direccion = request.json.get('direccion', None)
        
        return jsonify(qPacientes.insertar_paciente(dni,nombre, apellido, fecha_nac,telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion)), 200

@pacienteApi.route('/api/pacientes/<dni>', methods=['POST','GET','DELETE'])
@jwt_required(locations=['cookies','headers'])
def zona(dni):
    if request.method == 'GET':
        data = qPacientes.trar_un_paciente(dni)
        if data != None:
            return jsonify({
                    'dni_paciente': data[0],
                    'nombre': data[1],
                    'apellido': data[2],
                    'fecha_nac': data[3],
                    'sexo': data[4],
                    'telefono': data[5],
                    'fecha_hora_ingreso': data[6],
                    'fecha_hora_egreso': data[7],
                    'tipo_sangre': data[8]
                }), 200
        else:
            return jsonify({
                'msg': 'Not Found'
            }) ,404
    
    if get_jwt_identity()['role'] == 'administrador':
    
        if request.method == 'POST':
            dni = dni
            nombre = request.json.get('nombre', None)
            apellido = request.json.get('apellido', None)
            fecha_nac = request.json.get('fecha_nac', None)
            telefono = request.json.get('telefono', None)
            sexo = request.json.get('sexo', None)
            fecha_hora_ingreso = request.json.get('fecha_hora_ingreso', None)
            fecha_hora_egreso = request.json.get('fecha_hora_egreso', None)
            tipo_sangre = request.json.get('tipo_sangre', None)
            direccion = request.json.get('direccion', None)
            
            return jsonify(qPacientes.editar_paciente(dni, nombre, apellido, fecha_nac, telefono, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre, direccion)), 200
        
        if request.method == 'DELETE':
            return jsonify(qPacientes.borrar_paciente(dni)), 200
        
        
    else:
        return jsonify({'msg': 'No autorizado'}), 403
    