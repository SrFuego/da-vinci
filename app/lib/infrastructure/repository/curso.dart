import '../../domain/models/curso.dart';
import '../../domain/repository/curso.dart';
import '../../infrastructure/repository/dio_client.dart';

class CursoRepositoryImpl implements CursoRepository {
  @override
  Future<List<Curso>> getCursos() async {
    List<Curso> cursosApi = [];
    final data = await DioClient.instance.get('/curso/');
    for (var index = 0; index < data['cursos'].length; index++) {
      Curso aux = Curso.fromJson(
        data['cursos'][index],
      );
      cursosApi.add(aux);
    }
    return cursosApi;
  }
}
