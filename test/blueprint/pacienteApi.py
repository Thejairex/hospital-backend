# Libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

from blueprint.helpers.queryPaciente import qPacientes

pacienteApi = Blueprint('pacienteApi', __name__, template_folder='app/templates')

@pacienteApi.route('/api/pacientes', methods = ['GET'])
def zonas():
    if request.method == 'GET':
        dataPacientes = qPacientes.traer_pacientes()
        
        jsonZona = []
        
        for data in dataPacientes:
            jsonZona.append({
                'dni_paciente': data[0],
                'nombre': data[1],
                'apellido': data[2],
                'fecha_nac': data[3],
                'sexo': data[4],
                'telefono': data[5],
                'fecha_hora_ingreso': data[6],
                'fecha_hora_egreso': data[7],
                'tipo_sangre': data[8]
            })
            
        return jsonify(jsonZona), 200

@pacienteApi.route('/api/paciente/<dni>', methods=['POST','GET','DELETE'])
@jwt_required(locations=['cookies','headers'])
def zona(dni):
    if request.method == 'GET':
        data = qPacientes.trar_un_paciente(dni)
        
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
        
    if request.method == 'POST':
        dni = dni
        nombre = request.json.get('nombre', None)
        apellido = request.json.get('numero', None)
        fecha_nac = request.json.get('id_forma_llamada', None)
        sexo = request.json.get('dni_paciente', None)
        fecha_hora_ingreso = request.json.get('fecha_hora_ingreso', None)
        fecha_hora_egreso = request.json.get('fecha_hora_egreso', None)
        tipo_sangre = request.json.get('tipo_sangre', None)
        
        return jsonify(qPacientes.editar_paciente(dni, nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre)), 200
    
    if get_jwt_identity()['role'] == 'administrador':
        
        
        if request.method == 'DELETE':
            return jsonify(qPacientes.borrar_paciente(dni)), 200
        
        
    else:
        return jsonify({'msg': 'No autorizado'}), 403
    
@pacienteApi.route('/api/zona/add', methods=['POST'])
def nueva_zona():
    if request.method == 'POST':
        nombre = request.json.get('nombre', None)
        apellido = request.json.get('numero', None)
        fecha_nac = request.json.get('id_forma_llamada', None)
        sexo = request.json.get('dni_paciente', None)
        fecha_hora_ingreso = request.json.get('fecha_hora_ingreso', None)
        fecha_hora_egreso = request.json.get('fecha_hora_egreso', None)
        tipo_sangre = request.json.get('tipo_sangre', None)
        
        return jsonify(qPacientes.insertar_paciente(nombre, apellido, fecha_nac, sexo, fecha_hora_ingreso, fecha_hora_egreso, tipo_sangre)), 200