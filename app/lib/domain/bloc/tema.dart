// import 'package:flutter/material.dart';

import '../models/tema.dart';
import '../../infrastructure/repository/tema.dart';

class TemaBloc {
// class PreguntaBloc extends ChangeNotifier {
  final repository = TemaRepositoryImpl();

  Future<List<Tema>> getTemas(String cursoSlug) {
    return repository.getTemasPorCurso(cursoSlug);
  }
}
