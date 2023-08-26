import '../models/pregunta.dart';
import '../models/solucion.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPregunta();
  Future<Solucion> postResolverPregunta(int id);
}
