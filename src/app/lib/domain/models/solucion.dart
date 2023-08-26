// To parse this JSON data, do
//
//     final solucion = solucionFromJson(jsonString);

// import 'dart:convert';

// Solucion solucionFromJson(String str) => Solucion.fromJson(json.decode(str));

// String solucionToJson(Solucion data) => json.encode(data.toJson());
import 'pregunta.dart';

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

  factory RespuestaEvaluada.fromJson(Map<String, dynamic> json) =>
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

class Alternativa {
  final int id;
  final String valor;

  Alternativa({
    required this.id,
    required this.valor,
  });

  factory Alternativa.fromJson(Map<String, dynamic> json) => Alternativa(
        id: json["id"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
      };
}

class Solucion {
  final int id;
  final String teoria;
  final String resolucion;
  final Pregunta pregunta;
  final Alternativa alternativaCorrecta;

  Solucion({
    required this.id,
    required this.teoria,
    required this.resolucion,
    required this.pregunta,
    required this.alternativaCorrecta,
  });

  factory Solucion.fromJson(Map<String, dynamic> json) => Solucion(
        id: json["id"],
        teoria: json["teoria"],
        resolucion: json["resolucion"],
        pregunta: Pregunta.fromJson(json["pregunta"]),
        alternativaCorrecta: Alternativa.fromJson(json["alternativa_correcta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teoria": teoria,
        "resolucion": resolucion,
        "pregunta": pregunta.toJson(),
        "alternativa_correcta": alternativaCorrecta.toJson(),
      };
}

// class Pregunta {
//   final int id;
//   final String enunciado;
//   final List<Alternativa> alternativas;
//   final Curso tema;
//   final Curso curso;

//   Pregunta({
//     required this.id,
//     required this.enunciado,
//     required this.alternativas,
//     required this.tema,
//     required this.curso,
//   });

//   factory Pregunta.fromJson(Map<String, dynamic> json) => Pregunta(
//         id: json["id"],
//         enunciado: json["enunciado"],
//         alternativas: List<Alternativa>.from(
//             json["alternativas"].map((x) => Alternativa.fromJson(x))),
//         tema: Curso.fromJson(json["tema"]),
//         curso: Curso.fromJson(json["curso"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "enunciado": enunciado,
//         "alternativas": List<dynamic>.from(alternativas.map((x) => x.toJson())),
//         "tema": tema.toJson(),
//         "curso": curso.toJson(),
//       };
// }

// class Curso {
//   final int id;
//   final String nombre;

//   Curso({
//     required this.id,
//     required this.nombre,
//   });

//   factory Curso.fromJson(Map<String, dynamic> json) => Curso(
//         id: json["id"],
//         nombre: json["nombre"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nombre": nombre,
//       };
// }
