import 'alternativa.dart';
import 'tema.dart';

class Pregunta {
  final String enunciado;
  final List<Alternativa> alternativas;
  final Tema tema;

  Pregunta({
    required this.enunciado,
    required this.alternativas,
    required this.tema,
  });

  factory Pregunta.fromJson(
    Map<String, dynamic> json,
  ) =>
      Pregunta(
        enunciado: json["enunciado"],
        alternativas: List<Alternativa>.from(
          json["alternativas"].map(
            (x) => Alternativa.fromJson(x),
          ),
        ),
        tema: Tema.fromJson(json["tema"]),
      );

  Map<String, dynamic> toJson() => {
        "enunciado": enunciado,
        "alternativas": List<dynamic>.from(
          alternativas.map((x) => x.toJson()),
        ),
        "tema": tema.toJson(),
      };
}
