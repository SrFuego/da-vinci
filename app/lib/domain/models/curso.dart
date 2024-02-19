class Curso {
  String nombre;
  String slug;

  Curso({
    required this.nombre,
    required this.slug,
  });

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        nombre: json["nombre"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "slug": slug,
      };
}
