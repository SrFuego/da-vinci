import 'package:da_vinci/domain/repository/pregunta.dart';
import 'package:da_vinci/infrastructure/repository/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/models/pregunta.dart';

// class DioClient {
//   final Dio _dio = Dio();

//   // https://srfuego.pythonanywhere.com/api/v1/pregunta_aleatoria/
//   final _baseUrl = 'https://srfuego.pythonanywhere.com/api/v1';

//   Future<Pregunta> getPreguntaAPI() async {
//     Pregunta preguntaApi;

//     // print("va traer data de:");
//     // print(_baseUrl + ('/pregunta_aleatoria/'));

//     final response = await _dio.get(_baseUrl + ('/pregunta_aleatoria/'));

//     if (response.statusCode == 200) {
//       // print('Response data: ${response.data}');
//       preguntaApi = Pregunta.fromJson(response.data);
//       return preguntaApi;
//     } else {
//       throw Exception('Failed to load: pregunta aleatoria');
//     }
//   }
// }

class PreguntaRepositoryImpl implements PreguntaRepository {
  @override
  Future<Pregunta> getPreguntaAleatoria() async {
    Pregunta preguntaApi;

    // print("va traer data de:");
    // print(_baseUrl + ('/pregunta_aleatoria/'));

    final data = await DioClient.instance.get('/pregunta_aleatoria/');
    preguntaApi = Pregunta.fromJson(data);
    return preguntaApi;
  }
}
