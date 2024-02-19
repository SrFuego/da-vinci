import '../models/pregunta.dart';
import '../models/solucion.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPregunta();
  Future<Pregunta> getPreguntaPorCurso(String cursoSlug);
  Future<Pregunta> getPreguntaPorTema(String temaSlug);
  Future<RespuestaEvaluada> postResolverPregunta(int alternativaId);
}
