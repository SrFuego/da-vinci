import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import '../../infrastructure/repository/pregunta.dart';

class PreguntaBloc extends ChangeNotifier {
  final repository = PreguntaRepositoryImpl();

  Future<Pregunta> getPreguntaAleatoria() {
    Future<Pregunta> pregunta = repository.getPreguntaAleatoria();
    return pregunta;
  }
}
