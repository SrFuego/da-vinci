class Curso {
  int id;
  String nombre;

  Curso({required this.id, required this.nombre});

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}

class Tema {
  final int id;
  final String nombre;

  Tema({required this.id, required this.nombre});

  factory Tema.fromJson(Map<String, dynamic> json) {
    return Tema(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
