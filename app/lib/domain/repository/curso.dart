import '../models/curso.dart';

abstract class CursoRepository {
  Future<List<Curso>> getCursos();
}
