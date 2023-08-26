import '../../domain/models/pregunta.dart';
import '../../domain/models/solucion.dart';
import '../../domain/repository/pregunta.dart';
import '../../infrastructure/repository/dio_client.dart';

class PreguntaRepositoryImpl implements PreguntaRepository {
  @override
  Future<Pregunta> getPregunta() async {
    Pregunta preguntaApi;

    // print("va traer data de:");
    // print(_baseUrl + ('/pregunta_aleatoria/'));

    final data = await DioClient.instance.get('/pregunta_aleatoria/');
    preguntaApi = Pregunta.fromJson(data);
    return preguntaApi;
  }

  @override
  Future<RespuestaEvaluada> postResolverPregunta(int id) async {
    // print("va traer data de:");
    // print('/resolver_pregunta_individual/$id');
    var data = {"alternativa_seleccionada_id": id};

    final responseData = await DioClient.instance
        .post('/resolver_pregunta_individual/', data: data);
    // print(responseData);
    return RespuestaEvaluada.fromJson(responseData);
  }
}
