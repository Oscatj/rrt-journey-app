import 'dart:convert';

class Transporte {
  String tipo;
  double? precio;

  Transporte ({
    required this.tipo,
    this.precio
  });

  factory Transporte.fromJson(Map<String, dynamic>json){
    return Transporte(
      tipo: json['tipo'],
      precio: json['precio']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'tipo': tipo,
      'precio': precio
    };
  }
}