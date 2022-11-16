# Libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

from blueprint.helpers.queryZona import qZona
from blueprint.helpers.queryLlamada import qLlamada
zonaApi = Blueprint('zonaApi', __name__, template_folder='app/templates')

@zonaApi.route('/api/zonas', methods = ['GET','POST'])
def zonas():
    if request.method == 'GET':
        
        colum = []
        data = []
        
        for x in request.args:
            colum.append(x)
            data.append(request.args.get(x))
        print(len(colum),data)
        dataZonas = qZona.traer_zonas(colum, data)
        
        jsonZona = []
        
        for data in dataZonas:
            jsonZona.append({
                'id_zona': data[0],
                'nombre': data[1],
                'numero': data[2],
                'id_forma_llamada': data[3],
                'dni_enfermero': data[4],
                'id_llamada': data[5],
                'descripcion': data[6],
                'estado': data[7],
                'dni_paciente': data[8],
                'nombre_paciente': data[9],
                'apellido_paciente': data[10],
                'nombre_enfermero': data[11],
                'apellido_enfermero': data[12]
            })
            
        return jsonify(jsonZona), 200

    if request.method == 'POST':
        nombre = request.json.get('nombre', None)
        numero = request.json.get('numero', None)   
        id_forma_llamada = request.json.get('id_forma_llamada', None)
        dni_enfermero = request.json.get('dni_enfermero', None)
        id_llamada = qLlamada.traer_ultima_llamada()[0]
        descripcion = request.json.get('descripcion', None)
        estado = request.json.get('estado', None)
        
        return jsonify(qZona.insertar_zona(nombre,numero, id_forma_llamada, dni_enfermero, id_llamada, descripcion, estado)), 200

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
                'dni_enfermero': dataZona[4],
                'id_llamada': dataZona[5],
                'descripcion': dataZona[6],
                'estado': dataZona[7],
                'dni_paciente': dataZona[8],
                'nombre_paciente': dataZona[9],
                'apellido_paciente': dataZona[10],
                'nombre_enfermero': dataZona[11],
                'apellido_enfermero': dataZona[12]
            }), 200
        
    if get_jwt_identity()['role'] == 'administrador':
        
        
        if request.method == 'DELETE':
            return jsonify(qZona.borrar_zona(id)), 200
        
        if request.method == 'POST':
            nombre = request.json.get('nombre', None)
            numero = request.json.get('numero', None)   
            id_forma_llamada = request.json.get('id_forma_llamada', None)
            dni_enfermero = request.json.get('dni_enfermero', None)
            id_llamada = qLlamada.traer_ultima_llamada()[0]
            descripcion = request.json.get('descripcion', None)
            estado = request.json.get('estado', None)
            
            return jsonify(qZona.editar_zona(id, nombre, numero, id_forma_llamada, dni_enfermero, id_llamada,descripcion, estado)), 200
    else:
        return jsonify({'msg': 'No autorizado'}), 401
    