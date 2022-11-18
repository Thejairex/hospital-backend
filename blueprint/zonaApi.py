# Import libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

# Import moduls
from blueprint.helpers.queryZona import qZona
from blueprint.helpers.queryLlamada import qLlamada

# Init blueprint
zonaApi = Blueprint('zonaApi', __name__, template_folder='app/templates')

# Routes of zonas Api

# Routes general
@zonaApi.route('/api/zonas', methods = ['GET','POST'])
def zonas():
    
    # Fetch all Zones
    if request.method == 'GET':
        
        colum = []
        data = []
        jsonZona = []
        
        for x in request.args:
            colum.append(x)
            data.append(request.args.get(x))
        print(len(colum),data)
        dataZonas = qZona.traer_zonas(colum, data)
        
        for data in dataZonas:
            jsonZona.append({
                'id_zona': data[0],
                'nombre': data[1],
                'numero': data[2],
                'id_forma_llamada': data[3],
                'dni_enfermero': data[4],
                'dni_paciente': data[5],
                'descripcion': data[6],
                'estado': data[7],
                'nombre_paciente': data[8],
                'apellido_paciente': data[9],
                'nombre_enfermero': data[10],
                'apellido_enfermero': data[11],
                'id_llamada': qLlamada.traer_ultima_llamada(data[0])
            })
            
        return jsonify(jsonZona), 200

    # Insert new Zona
    if request.method == 'POST':
        nombre = request.json.get('nombre', None)
        numero = request.json.get('numero', None)   
        id_forma_llamada = request.json.get('id_forma_llamada', None)
        dni_enfermero = request.json.get('dni_enfermero', None)
        dni_paciente = request.json.get('dni_paciente', None)
        descripcion = request.json.get('descripcion', None)
        estado = request.json.get('estado', None)
        
        return jsonify(qZona.insertar_zona(nombre,numero, id_forma_llamada, dni_enfermero,dni_paciente, descripcion, estado)), 200

# Route protected
@zonaApi.route('/api/zonas/<id>', methods=['POST','GET','DELETE'])
@jwt_required(locations=['cookies','headers'])
def zona(id):
    
    # Fetch one zona
    if request.method == 'GET':
        data = qZona.traer_una_zona(id)
        
        return jsonify({
                'id_zona': data[0],
                'nombre': data[1],
                'numero': data[2],
                'id_forma_llamada': data[3],
                'dni_enfermero': data[4],
                'dni_paciente': data[5],
                'descripcion': data[6],
                'estado': data[7],
                'nombre_paciente': data[8],
                'apellido_paciente': data[9],
                'nombre_enfermero': data[10],
                'apellido_enfermero': data[11],
                'id_llamada': qLlamada.traer_ultima_llamada(data[0])
            }), 200
        
    # Verifies the role is Administrador
    if get_jwt_identity()['role'] == 'administrador':
        
        # Delete a Zona
        if request.method == 'DELETE':
            return jsonify(qZona.borrar_zona(id)), 200
        
        # Edit one zona
        if request.method == 'POST':
            nombre = request.json.get('nombre', None)
            numero = request.json.get('numero', None)   
            id_forma_llamada = request.json.get('id_forma_llamada', None)
            dni_enfermero = request.json.get('dni_enfermero', None)
            dni_paciente = request.json.get('dni_paciente', None)
            descripcion = request.json.get('descripcion', None)
            estado = request.json.get('estado', None)
            
            return jsonify(qZona.editar_zona(id, nombre, numero, id_forma_llamada, dni_enfermero, dni_paciente,descripcion, estado)), 200
    else:
        return jsonify({'msg': 'No autorizado'}), 401
    