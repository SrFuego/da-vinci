import '../../domain/models/respuestaEvaluada.dart';
import '../../domain/models/pregunta.dart';
import '../../domain/repository/pregunta.dart';
import '../../infrastructure/repository/dio_client.dart';

class PreguntaRepositoryImpl implements PreguntaRepository {
  @override
  Future<Pregunta> getPregunta() async {
    final response = await DioClient.instance.get('/pregunta_individual/');
    return Pregunta.fromJson(response.data);
  }

  @override
  Future<Pregunta> getPreguntaPorCurso(String cursoSlug) async {
    var path = '/pregunta_individual/?curso=$cursoSlug';
    final response = await DioClient.instance.get(path);
    return Pregunta.fromJson(response.data);
  }

  @override
  Future<Pregunta> getPreguntaPorTema(String temaSlug) async {
    var path = '/pregunta_individual/?tema=$temaSlug';
    final response = await DioClient.instance.get(path);
    return Pregunta.fromJson(response.data);
  }

  @override
  Future<RespuestaEvaluada> postResolverPregunta(int alternativaId) async {
    var data = {"alternativa_seleccionada_id": alternativaId};
    final response = await DioClient.instance.post(
      '/pregunta_individual/',
      data: data,
    );
    return RespuestaEvaluada.fromJson(response.data);
  }
}
