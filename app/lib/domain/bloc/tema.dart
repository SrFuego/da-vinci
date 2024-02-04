// import 'package:flutter/material.dart';

import '../models/tema.dart';
import '../../infrastructure/repository/tema.dart';

class TemaBloc {
// class PreguntaBloc extends ChangeNotifier {
  final repository = TemaRepositoryImpl();

  Future<List<Tema>> getTemas(int cursoId) {
    return repository.getTemasPorCurso(cursoId);
  }
}
