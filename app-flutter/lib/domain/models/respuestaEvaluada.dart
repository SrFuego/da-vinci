// To parse this JSON data, do
//
//     final solucion = solucionFromJson(jsonString);

// import 'dart:convert';

// Solucion solucionFromJson(String str) => Solucion.fromJson(json.decode(str));

// String solucionToJson(Solucion data) => json.encode(data.toJson());
import 'alternativa.dart';
import 'solucion.dart';

class RespuestaEvaluada {
  final Solucion solucion;
  final Alternativa alternativaEnviada;
  final bool esCorrecta;
  final double puntajeObtenido;

  RespuestaEvaluada({
    required this.solucion,
    required this.alternativaEnviada,
    required this.esCorrecta,
    required this.puntajeObtenido,
  });

  factory RespuestaEvaluada.fromJson(
    Map<String, dynamic> json,
  ) =>
      RespuestaEvaluada(
        solucion: Solucion.fromJson(json["solucion"]),
        alternativaEnviada: Alternativa.fromJson(json["alternativa_enviada"]),
        esCorrecta: json["es_correcta"],
        puntajeObtenido: json["puntaje_obtenido"],
      );

  Map<String, dynamic> toJson() => {
        "solucion": solucion.toJson(),
        "alternativa_enviada": alternativaEnviada.toJson(),
        "es_correcta": esCorrecta,
        "puntaje_obtenido": puntajeObtenido,
      };
}
