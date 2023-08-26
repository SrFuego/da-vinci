import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import '../models/solucion.dart';
import '../../infrastructure/repository/pregunta.dart';

class PreguntaBloc extends ChangeNotifier {
  final repository = PreguntaRepositoryImpl();

  Future<Pregunta> getPreguntaAleatoria() {
    Future<Pregunta> pregunta = repository.getPregunta();
    return pregunta;
  }

  Future<Solucion> postResolverPreguntaAleatoria(int id) {
    Future<Solucion> solucion = repository.postResolverPregunta(id);
    print('en el bloc');
    return solucion;
  }
}
