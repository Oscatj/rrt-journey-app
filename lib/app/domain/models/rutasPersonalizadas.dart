class RutasPersonalizadas {
  RutasPersonalizadas({
    this.id = '',
    required this.nombre, 
    required this.origen, 
    required this.destino
  });
    String? id;
    String nombre;
    String origen;
    String destino;
  
    Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'origen': origen,
    'destino': destino,
    };

  //Envia los datos de las propiedades definidas aqui en un json para enviar a la bs
    static RutasPersonalizadas fromJson(Map<String, dynamic> json) => RutasPersonalizadas(
      id: json['id'],
      nombre: json['nombre'],
      origen: json['origen'], 
      destino: json['destino'],
    );
}