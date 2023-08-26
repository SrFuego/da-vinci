import '../models/pregunta.dart';
import '../models/solucion.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPregunta();
  Future<RespuestaEvaluada> postResolverPregunta(int id);
}
