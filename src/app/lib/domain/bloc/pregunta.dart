import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import '../models/solucion.dart';
import '../../infrastructure/repository/pregunta.dart';

class PreguntaBloc extends ChangeNotifier {
  final repository = PreguntaRepositoryImpl();

  Future<Pregunta> getPreguntaAleatoria() {
    return repository.getPregunta();
  }

  Future<RespuestaEvaluada> postResolverPreguntaAleatoria(int id) {
    return repository.postResolverPregunta(id);
  }
}
