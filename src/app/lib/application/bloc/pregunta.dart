import 'package:flutter/material.dart';

import '../../infrastructure/models/pregunta.dart';
import '../../infrastructure/repository/pregunta.dart';

class PreguntaBloc extends ChangeNotifier {
  // final String enunciado = "dsadsa";
  // Future<Pregunta>? pregunta;
  final DioClient _client = DioClient();
  // var _pregunta = _client.getPregunta();
  // Pregunta? get pregunta => _pregunta;

  Pregunta getPreguntaAleatoria() {
    Pregunta pregunta = _client.getPregunta();
    return pregunta;
  }
}
