import '../models/pregunta.dart';
import '../models/solucion.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPregunta();
  Future<Pregunta> getPreguntaPorCurso(int cursoId);
  Future<RespuestaEvaluada> postResolverPregunta(int alternativaId);
}
