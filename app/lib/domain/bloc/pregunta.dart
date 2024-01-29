// import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import '../models/solucion.dart';
import '../../infrastructure/repository/pregunta.dart';

class PreguntaBloc {
// class PreguntaBloc extends ChangeNotifier {
  final repository = PreguntaRepositoryImpl();

  Future<Pregunta> getPreguntaAleatoria() {
    return repository.getPregunta();
  }

  Future<Pregunta> getPreguntaCurso(int cursoId) {
    return repository.getPreguntaPorCurso(cursoId);
  }

  Future<RespuestaEvaluada> postResolverPreguntaAleatoria(int alternativaId) {
    return repository.postResolverPregunta(alternativaId);
  }
}
