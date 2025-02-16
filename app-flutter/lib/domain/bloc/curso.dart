// import 'package:flutter/material.dart';

import '../models/curso.dart';
import '../../infrastructure/repository/curso.dart';

class CursoBloc {
// class PreguntaBloc extends ChangeNotifier {
  final repository = CursoRepositoryImpl();

  Future<List<Curso>> getListaCursos() {
    return repository.getCursos();
  }
}
