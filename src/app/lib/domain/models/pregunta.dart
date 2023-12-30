import 'curso.dart';

class Pregunta {
  final int id;
  final String enunciado;
  final List<Alternativa> alternativas;
  final Tema tema;
  final Curso curso;

  Pregunta({
    required this.id,
    required this.enunciado,
    required this.alternativas,
    required this.tema,
    required this.curso,
  });

  factory Pregunta.fromJson(Map<String, dynamic> json) => Pregunta(
        id: json["id"],
        enunciado: json["enunciado"],
        alternativas: List<Alternativa>.from(
          json["alternativas"].map(
            (x) => Alternativa.fromJson(x),
          ),
        ),
        tema: Tema.fromJson(json["tema"]),
        curso: Curso.fromJson(json["curso"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enunciado": enunciado,
        "alternativas": List<dynamic>.from(
          alternativas.map((x) => x.toJson()),
        ),
        "tema": tema.toJson(),
        "curso": curso.toJson(),
      };
}

class Alternativa {
  final int id;
  final String valor;

  Alternativa({required this.id, required this.valor});

  factory Alternativa.fromJson(Map<String, dynamic> json) => Alternativa(
        id: json["id"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {"id": id, "valor": valor};
}
