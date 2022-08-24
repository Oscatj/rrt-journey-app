class Journey {
  Journey ({
    this.id = '',
    required this.origen, 
    required this.destino,
    this.fecha
    });
    String? id;
    String origen;
    String destino; 
    String? fecha;

    Map<String, dynamic> toJson() => {
    'id': id,
    'origen': origen,
    'destino': destino,
    'fecha': fecha

    };

    static Journey fromJson(Map<String, dynamic> json) => Journey(
      id: json['id'],
      origen: json['origen'], 
      destino: json['destino'],
      fecha: json['fecha']

    );
}

   

