// import 'package:dio/dio.dart';
// ignore_for_file: avoid_print, unused_import, non_constant_identifier_names

import 'package:app_cliente/models/empresa.dart';
import 'package:http/http.dart' as http;
import 'package:app_cliente/models/usuario.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_cliente/utils/constantes.dart';

class AuthController {
  String estado = '';
  int id_usuario = 0;
  int id_cliente = 0;
  String id_tenant = '';
  Usuario usuario = Usuario();
  Map<String, dynamic>? validaciones = {};
  // final storage = const FlutterSecureStorage();

  static final AuthController _instancia = AuthController._internal();

  factory AuthController() {
    return _instancia;
  }

  AuthController._internal();

  // create Empresa
  Future<bool> loginStore(
      String correo, String contra, int seleccionado) async {
    print('=>> se esta haciendo la peticion!!');
    var responde = await http
        .post(Uri.parse("$urlApiLocal/api/login"), //la direccoines de la api
            //   "$UrlApiLocal/api/LoginStore",
            body: {
          'correo': correo,
          'contrasena': contra,
          'empresa': seleccionado.toString(),
        },
            headers: {
          'accept': 'application/json',
        });
    print('=>> Statuscode:');
    validaciones = {};
    Map<String, dynamic> miJson = json.decode(responde.body);
    if (responde.statusCode == 200 || responde.statusCode == 201) {
      estado = miJson['estado'];
      id_cliente = miJson['id_cliente'];
      id_tenant = miJson['id_tenant'];
      id_usuario = miJson['id_usuario'];
      // await storage.write(key: 'id_tenant', value: miJson['id_tenant']);
      // await storage.write(key: 'id_usuario', value: miJson['id_usuario']);
    } else {
      if (responde.statusCode == 401) {
        estado = 'error';
        validaciones!['mensaje'] = miJson['mensaje'];
      } else {
        if (responde.statusCode == 500) {
          validaciones!['mensaje'] = 'Error en el servidor';
        } else {
          validaciones!['mensaje'] = 'Error inesperado';
        }
      }
    }

    // final $xd = responde.body;
    return true;
  }

  Future<bool> registerStore() async {
    print('==> se esta haciendo la peticion!!');
    var responde = await http
        .post(Uri.parse("$urlApiLocal/api/registro"), //la direccoines de la api
            //   "$UrlApiLocal/api/LoginStore",
            body: {
          'correo': usuario.correo,
          'contrasena': usuario.contrasena,
          'registro': usuario.registro.toString(),
          'nombre': usuario.nombre,
          'ci': usuario.ci.toString(),
          'carrera': usuario.carrera,
          // 'telefono': usuario.telefono.toString(),
        },
            headers: {
          'accept': 'application/json',
        });
    print('Statuscode:');
    print(responde.statusCode);
    validaciones = {};
    Map<String, dynamic> miJson = json.decode(responde.body);
    if (responde.statusCode == 200 || responde.statusCode == 201) {
      estado = miJson['estado'];
      // this.mensaje= miJson['mensaje'];
    } else {
      estado = 'error';
      miJson['mensaje'].forEach((key, value) {
        validaciones![key] = value[0];
      });
    }
    return true;
  }

  // create Empresa
  Future<List<Map<String, dynamic>>> getEmpresas() async {
    print('=>> se esta haciendo la peticion!!');
    var responde = await http.get(
        Uri.parse("$urlApiLocal/api/getEmpersas"), //la direccoines de la api
        headers: {
          'accept': 'application/json',
        });
    print('=>> Statuscode:');
    validaciones = {};
    List<dynamic> miJson = json.decode(responde.body);
    if (responde.statusCode == 200 || responde.statusCode == 201) {
      return miJson.map((item) => item as Map<String, dynamic>).toList();
    } else {
      return [
        {'id': '0', 'nombre': 'error'}
      ];
    }
  }

  //get procesos crediticios
   Future<List<Map<String, dynamic>>> getProcesos() async {
    var responde = await http.get(
        Uri.parse("$urlApiLocal/api/getProcesos/$id_tenant/$id_cliente"), //la direccoines de la api
        headers: {
          'accept': 'application/json',
        });
    validaciones = {};
    List<dynamic> miJson = json.decode(responde.body);
    if (responde.statusCode == 200 || responde.statusCode == 201) {
      return miJson.map((item) => item as Map<String, dynamic>).toList();
    } else {
      return [
        {'error':'error'}
      ];
    }
  }
}
