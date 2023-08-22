import 'package:dio/dio.dart';

import '../models/pregunta.dart';

class DioClient {
  final Dio _dio = Dio();

  // https://srfuego.pythonanywhere.com/api/v1/pregunta_aleatoria/
  final _baseUrl = 'https://srfuego.pythonanywhere.com/api/v1/';

  Future<Pregunta> getPregunta() async {
    Pregunta pregunta;
    Response response = await _dio.get(_baseUrl + ('pregunta_aleatoria/'));
    if (response.statusCode == 200) {
      print('Response data: ${response.data}');
      pregunta = Pregunta.fromJson(response.data);
      return pregunta;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      print('Dio error!');
      throw Exception('Failed to load post');
    }

    // } on DioException catch (e) {
    //   // The request was made and the server responded with a status code
    //   // that falls out of the range of 2xx and is also not 304.
    //   if (e.response != null) {
    //     print('Dio error!');
    //     print('STATUS: ${e.response?.statusCode}');
    //     print('DATA: ${e.response?.data}');
    //     print('HEADERS: ${e.response?.headers}');
    //   } else {
    //     // Error due to setting up or sending the request
    //     print('Error sending request!');
    //     print(e.message);
    //   }
    // }
  }
}
