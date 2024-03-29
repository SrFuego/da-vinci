import '../../domain/models/curso.dart';
import '../../domain/repository/curso.dart';
import '../../infrastructure/repository/dio_client.dart';

class CursoRepositoryImpl implements CursoRepository {
  @override
  Future<List<Curso>> getCursos() async {
    List<Curso> cursosApi = [];
    final response = await DioClient.instance.get('/curso/');
    for (var item in response.data) {
      cursosApi.add(
        Curso.fromJson(item),
      );
    }
    return cursosApi;
  }
}
