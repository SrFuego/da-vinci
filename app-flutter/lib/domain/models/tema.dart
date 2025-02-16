import 'curso.dart';

class Tema {
  final String nombre;
  final String slug;
  final Curso curso;

  Tema({
    required this.nombre,
    required this.slug,
    required this.curso,
  });

  factory Tema.fromJson(Map<String, dynamic> json) => Tema(
        nombre: json['nombre'] as String,
        slug: json['slug'] as String,
        curso: Curso.fromJson(json["curso"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "slug": slug,
        "curso": curso.toJson(),
      };
}
