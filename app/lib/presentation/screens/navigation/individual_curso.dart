import 'package:flutter/material.dart';

import '../../../domain/bloc/curso.dart';
import '../../../domain/models/curso.dart';
import '../../components/route_button.dart';
import '../base_screen.dart';

class IndividualCursoScreen extends StatefulWidget {
  const IndividualCursoScreen({super.key});

  @override
  State<IndividualCursoScreen> createState() => _IndividualCursoScreenState();
}

class _IndividualCursoScreenState extends State<IndividualCursoScreen> {
  @override
  Widget build(BuildContext context) {
    final cursoBloc = CursoBloc();

    return FutureBuilder(
      future: cursoBloc.getListaCursos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<Curso> cursos = snapshot.data!;
            return BaseScreen(
              title: 'Pregunta Individual',
              body: <Widget>[
                const SizedBox(height: 40.0),
                const RouterButtonWithDescription(
                  title: 'Curso Aleatorio',
                  description: '',
                  verticalSize: 7.0,
                  route: 'individual/aleatoria/',
                ),
                // const SizedBox(height: 10.0),
                for (Curso curso in cursos)
                  RouterButtonWithDescription(
                    title: curso.nombre,
                    description: '',
                    verticalSize: 7.0,
                    arguments: {
                      'cursoSlug': curso.slug,
                    },
                    route: 'individual/temas/',
                  ),
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
