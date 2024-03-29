import 'alternativa.dart';
import 'pregunta.dart';

class Solucion {
  final String teoria;
  final String resolucion;
  final Pregunta pregunta;
  final Alternativa alternativaCorrecta;

  Solucion({
    required this.teoria,
    required this.resolucion,
    required this.pregunta,
    required this.alternativaCorrecta,
  });

  factory Solucion.fromJson(
    Map<String, dynamic> json,
  ) =>
      Solucion(
        teoria: json["teoria"],
        resolucion: json["resolucion"],
        pregunta: Pregunta.fromJson(json["pregunta"]),
        alternativaCorrecta: Alternativa.fromJson(json["alternativa_correcta"]),
      );

  Map<String, dynamic> toJson() => {
        "teoria": teoria,
        "resolucion": resolucion,
        "pregunta": pregunta.toJson(),
        "alternativa_correcta": alternativaCorrecta.toJson(),
      };
}
