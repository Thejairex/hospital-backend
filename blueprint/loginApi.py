# Import  libraries
from flask import Flask, render_template, request, redirect, url_for, flash, Blueprint, jsonify
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, set_access_cookies, unset_jwt_cookies, verify_jwt_in_request
import hashlib

# Import blueprint
from init import jwt
from blueprint.helpers.queryLogin import qUser

# Init blueprint
loginApi = Blueprint('loginApi', __name__, template_folder='app/templates')

# Routes of Login APIs

# Login Route
@loginApi.route("/api/login", methods=['POST'])
def login():
    if request.method == 'POST':
        username = request.json.get("username", None)
        password = request.json.get("password", None)
        password = hashlib.sha256(password.encode('utf-8')).hexdigest()
        userData = qUser.userLogin(username)
        
        if userData != None:
            if userData[2] == password:
                
                roleTempo = ['usuario','administrador']
                
                access_token = create_access_token(identity={
                'id_user': userData[0],
                'username': userData[1],
                'email': userData[3],
                'role': roleTempo[userData[4]]
                })

                response = jsonify({
                        'accessToken': access_token,
                        'username': userData[1],
                        'email': userData[3],
                        'role': roleTempo[userData[4]]
                    })
                
                set_access_cookies(response, access_token)
                
                return response, 200
            else:
                
                return jsonify({
                    'msg': 'Contraseña incorrecta'
                }), 403
        else:
            
            return jsonify({
                "msg": "Cuenta no encontrada"
            }), 404


# token in cookies
@loginApi.route("/api/user", methods=['GET'])
@jwt_required(locations='cookies')
def user():
    current_user = get_jwt_identity()
    return jsonify(current_user), 200

# SignUp Route
@loginApi.route("/api/signup", methods=['POST'])
@jwt_required(locations=['cookies','headers']) 
def signup():
    if get_jwt_identity()['role'] != 'administrador':
        return jsonify({'msg': 'No autorizado'}), 403
    if request.method == 'POST':
        username = request.json.get("username", None)
        email = request.json.get("email", None)
        password = request.json.get("password", None)
        password = hashlib.sha256(password.encode('utf-8')).hexdigest()
        role = request.json.get("role", None)
        
        fetchUser = qUser.userLogin(username)
        
        if fetchUser == None:
            
            
            userData = qUser.userRegister(username, password, email, role)
            
            if userData != None:

                access_token = create_access_token(identity={
                    'id_user': userData[0],
                    'username': userData[1],
                    'email': userData[3],
                    'role': userData[4],
                })

                response = jsonify({
                    'accessToken': access_token,
                    'username': userData[1],
                    'email': userData[3],
                    'role': userData[4],
                })

                set_access_cookies(response, access_token)
                return response, 200
            else:
                return jsonify({
                "msg": "Your email is registered"
            }), 403

        else:
            return jsonify({
                "msg": "Tu nombre de usuario ya esta registrado"
            }), 403

# Logout Route
@loginApi.route("/api/logout", methods=['POST'])
def logout():
    response = jsonify({"msg": "Logout Successful"})
    unset_jwt_cookies(response)
    return response