import '../../domain/models/tema.dart';
import '../../domain/repository/tema.dart';
import '../../infrastructure/repository/dio_client.dart';

class TemaRepositoryImpl implements TemaRepository {
  @override
  Future<List<Tema>> getTemasPorCurso(int cursoId) async {
    List<Tema> temasApi = [];
    final data = await DioClient.instance.get(
      '/curso/$cursoId/tema/',
    );
    for (var index = 0; index < data['temas'].length; index++) {
      Tema aux = Tema.fromJson(
        data['temas'][index],
      );
      temasApi.add(aux);
    }
    return temasApi;
  }
}
