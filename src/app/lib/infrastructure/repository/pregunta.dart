import 'package:dio/dio.dart';

import '../models/pregunta.dart';

class DioClient {
  final Dio _dio = Dio();

  // https://srfuego.pythonanywhere.com/api/v1/pregunta_aleatoria/
  final _baseUrl = 'https://srfuego.pythonanywhere.com/api/v1/';

  // Future<Pregunta> getPregunta() async {
  //   // Pregunta pregunta;
  //   print("va traer data de:");
  //   print(_baseUrl + ('pregunta_aleatoria/'));
  //   Response response = await _dio.get(_baseUrl + ('pregunta_aleatoria/'));
  //   if (response.statusCode == 200) {
  //     print('Response data: ${response.data}');
  //     return Pregunta.fromJson(response.data);
  //   } else {
  //     // Si esta respuesta no fue OK, lanza un error.
  //     print('Dio error!');
  //     throw Exception('Failed to load post');
  //   }
  // }

  Pregunta getPregunta() {
    // Future<Pregunta> getPregunta() async {
    Pregunta pregunta = Pregunta.fromJson({
      "id": 1,
      "enunciado": "¿Cuánto es 2 + 2?",
      "alternativas": [
        {"id": 3, "valor": "5"},
        {"id": 2, "valor": "4"},
        {"id": 4, "valor": "6"},
        {"id": 1, "valor": "3"},
        {"id": 5, "valor": "7"}
      ],
      "tema": {"id": 1, "nombre": "Operaciones combinadas"},
      "curso": {"id": 5, "nombre": "Álgebra"}
    });

    // print("va traer data de:");
    // print(_baseUrl + ('pregunta_aleatoria/'));
    // Response response = await _dio.get(_baseUrl + ('pregunta_aleatoria/'));
    // if (response.statusCode == 200) {
    //   print('Response data: ${response.data}');
    //   return Pregunta.fromJson(response.data);
    // } else {
    //   // Si esta respuesta no fue OK, lanza un error.
    //   print('Dio error!');
    //   throw Exception('Failed to load post');
    // }

    return pregunta;
  }
}
