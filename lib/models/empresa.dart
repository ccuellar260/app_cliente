// To parse this JSON data, do
//
//     final empresa = empresaFromJson(jsonString);

import 'dart:convert';

Empresa empresaFromJson(String str) => Empresa.fromJson(json.decode(str));

String empresaToJson(Empresa data) => json.encode(data.toJson());

class Empresa {
    int id;
    String nombre;
    dynamic foto;
    int idPlan;
    String idTenant;
    DateTime createdAt;
    DateTime updatedAt;

    Empresa({
        required this.id,
        required this.nombre,
        this.foto,
        required this.idPlan,
        required this.idTenant,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        id: json["id"],
        nombre: json["nombre"],
        foto: json["foto"],
        idPlan: json["id_plan"],
        idTenant: json["id_tenant"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "foto": foto,
        "id_plan": idPlan,
        "id_tenant": idTenant,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
