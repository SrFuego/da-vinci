import '../../domain/models/pregunta.dart';
import '../../domain/models/solucion.dart';
import '../../domain/repository/pregunta.dart';
import '../../infrastructure/repository/dio_client.dart';

class PreguntaRepositoryImpl implements PreguntaRepository {
  @override
  Future<Pregunta> getPregunta() async {
    final data = await DioClient.instance.get('/pregunta_individual/');
    return Pregunta.fromJson(data);
  }

  @override
  Future<Pregunta> getPreguntaPorCurso(int cursoId) async {
    var path = '/pregunta_individual/?curso_id=$cursoId';
    final data = await DioClient.instance.get(path);
    return Pregunta.fromJson(data);
  }

  @override
  Future<Pregunta> getPreguntaPorTema(int temaId) async {
    var path = '/pregunta_individual/?tema_id=$temaId';
    final data = await DioClient.instance.get(path);
    return Pregunta.fromJson(data);
  }

  @override
  Future<RespuestaEvaluada> postResolverPregunta(int alternativaId) async {
    var data = {"alternativa_seleccionada_id": alternativaId};
    final responseData = await DioClient.instance.post(
      '/pregunta_individual/',
      data: data,
    );
    return RespuestaEvaluada.fromJson(responseData);
  }
}
