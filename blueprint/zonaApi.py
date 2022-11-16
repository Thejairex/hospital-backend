# Libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

from blueprint.helpers.queryZona import qZona

zonaApi = Blueprint('zonaApi', __name__, template_folder='app/templates')

@zonaApi.route('/api/zonas', methods = ['GET','POST'])
def zonas():
    if request.method == 'GET':
        dataZonas = qZona.traer_zonas()
        
        jsonZona = []
        
        for data in dataZonas:
            jsonZona.append({
                'id_zona': data[0],
                'nombre': data[1],
                'numero': data[2],
                'id_forma_llamada': data[3],
                'dni_paciente': data[4],
                'dni_enfermero': data[5],
                'id_llamada': data[6],
                'descripcion': data[7],
                'nombre_paciente': data[8],
                'apellido_paciente': data[9],
                'nombre_enfermero': data[10],
                'apellido_enfermero': data[11]
            })
            
        return jsonify(jsonZona), 200

    if request.method == 'POST':
        nombre = request.json.get('nombre', None)
        numero = request.json.get('numero', None)   
        id_forma_llamada = request.json.get('id_forma_llamada', None)
        dni_paciente = request.json.get('dni_paciente', None)
        dni_enfermero = request.json.get('dni_enfermero', None)
        
        return jsonify(qZona.insertar_zona(nombre,numero, id_forma_llamada, dni_paciente, dni_enfermero)), 200

@zonaApi.route('/api/zonas/<id>', methods=['POST','GET','DELETE'])
@jwt_required(locations=['cookies','headers'])
def zona(id):
    if request.method == 'GET':
        dataZona = qZona.traer_una_zona(id)
        
        return jsonify({
            'id_zona': dataZona[0],
            'nombre': dataZona[1],
            'numero': dataZona[2],
            'id_forma_llamada': dataZona[3],
            'dni_paciente': dataZona[4],
            'dni_enfermero': dataZona[5],
            'id_llamada': dataZona[6],
            'descripcion': dataZona[7]
        }), 200
        
    if get_jwt_identity()['role'] == 'administrador':
        
        
        if request.method == 'DELETE':
            return jsonify(qZona.borrar_zona(id)), 200
        
        if request.method == 'POST':
            id_zona = id
            nombre = request.json.get('nombre', None)
            numero = request.json.get('numero', None)
            id_forma_llamada = request.json.get('id_forma_llamada', None)
            dni_paciente = request.json.get('dni_paciente', None)
            dni_enfermero = request.json.get('dni_enfermero', None)
            id_llamada = request.json.get('id_llamada', None)
            descripcion = request.json.get('descripcion', None)
            
            return jsonify(qZona.editar_zona(id_zona, nombre, numero, id_forma_llamada, dni_paciente, dni_enfermero,id_llamada, descripcion)), 200
    else:
        return jsonify({'msg': 'No autorizado'}), 403
    