import '../../domain/models/tema.dart';
import '../../domain/repository/tema.dart';
import '../../infrastructure/repository/dio_client.dart';

class TemaRepositoryImpl implements TemaRepository {
  @override
  Future<List<Tema>> getTemasPorCurso(String cursoSlug) async {
    List<Tema> temasApi = [];
    final response = await DioClient.instance.get(
      '/curso/$cursoSlug/tema/',
    );
    for (var item in response.data) {
      temasApi.add(Tema.fromJson(item));
    }
    return temasApi;
  }
}
