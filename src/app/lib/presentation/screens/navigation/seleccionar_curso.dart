import 'package:flutter/material.dart';

import '../../../domain/models/curso.dart';
import '../../../domain/bloc/curso.dart';
import '../../components/route_button.dart';
import '../base_screen.dart';

class SeleccionarCursoScreen extends StatefulWidget {
  const SeleccionarCursoScreen({super.key});

  @override
  State<SeleccionarCursoScreen> createState() => _SeleccionarCursoScreenState();
}

class _SeleccionarCursoScreenState extends State<SeleccionarCursoScreen> {
  @override
  Widget build(BuildContext context) {
    final cursoBloc = CursoBloc();

    return FutureBuilder(
      future: cursoBloc.getListaCursos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<Curso>? cursos = snapshot.data;
            return BaseScreen(
              title: 'Selecciona Curso',
              body: <Widget>[
                const SizedBox(height: 40.0),
                for (Curso curso in cursos!)
                  RouterButtonWithDescription(
                      title: curso.nombre,
                      description: '',
                      verticalSize: 7.0,
                      arguments: {'curso': curso.id},
                      route: 'individual/por_curso/'),
              ],
            );
          }
          return const Placeholder();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
