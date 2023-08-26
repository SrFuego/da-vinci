import '../../domain/models/pregunta.dart';
import '../../domain/models/solucion.dart';
import '../../domain/repository/pregunta.dart';
import '../../infrastructure/repository/dio_client.dart';

class PreguntaRepositoryImpl implements PreguntaRepository {
  @override
  Future<Pregunta> getPregunta() async {
    Pregunta preguntaApi;

    // print("va traer data de:");
    // print(_baseUrl + ('/pregunta_aleatoria/'));

    final data = await DioClient.instance.get('/pregunta_aleatoria/');
    preguntaApi = Pregunta.fromJson(data);
    return preguntaApi;
  }

  @override
  Future<Solucion> postResolverPregunta(int id) async {
    Solucion solucion;

    print("va traer data de:");
    print('/resolver_pregunta_individual/$id');
    var data = {"alternativa_seleccionada_id": id};
    // var data = {"alternativa_seleccionada_id": id};

    final responseData = await DioClient.instance
        .post('/resolver_pregunta_individual/', data: data);
    print(responseData);
    // solucion = Solucion.fromJson(responseData);
    solucion = Solucion.fromJson({
      "solucion": {
        "id": 3,
        "teoria": "",
        "resolucion": "Dina Boluarte",
        "pregunta": {
          "id": 3,
          "enunciado": "¿Quién ocupa la presidencia en el Perú?",
          "alternativas": [
            {"id": 11, "valor": "Dina Boluarte"},
            {"id": 12, "valor": "Ollanta Humala"},
            {"id": 13, "valor": "Alan García"},
            {"id": 10, "valor": "Pedro Castillo"}
          ],
          "tema": {"id": 3, "nombre": "Cargos Públicos"},
          "curso": {"id": 10, "nombre": "Educación Cívica"}
        },
        "alternativa_correcta": {"id": 11, "valor": "Dina Boluarte"}
      },
      "alternativa_enviada": {"id": 10, "valor": "Pedro Castillo"},
      "es_correcta": false,
      "puntaje_obtenido": -5.0
    });
    print(solucion);
    return solucion;
  }
}
