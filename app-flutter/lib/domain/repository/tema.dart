import '../models/tema.dart';

abstract class TemaRepository {
  Future<List<Tema>> getTemasPorCurso(String cursoSlug);
}
