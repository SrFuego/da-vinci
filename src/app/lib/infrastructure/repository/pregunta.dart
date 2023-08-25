import '../../domain/models/pregunta.dart';
import '../../domain/repository/pregunta.dart';
import '../../infrastructure/repository/dio_client.dart';

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
