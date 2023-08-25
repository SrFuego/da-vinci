import '../models/pregunta.dart';

abstract class PreguntaRepository {
  Future<Pregunta> getPreguntaAleatoria();
}
