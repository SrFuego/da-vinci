import '../models/respuestaEvaluada.dart';
import '../models/pregunta.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPregunta();
  Future<Pregunta> getPreguntaPorCurso(String cursoSlug);
  Future<Pregunta> getPreguntaPorTema(String temaSlug);
  Future<RespuestaEvaluada> postResolverPregunta(int alternativaId);
}
