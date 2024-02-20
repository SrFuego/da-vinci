import 'package:flutter/material.dart';

import '../../../domain/bloc/curso.dart';
import '../../../domain/models/curso.dart';
import '../../screens/navigation/individual_tema.dart';
import '../../controllers/pregunta_aleatoria.dart';
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
                const RouterButton(
                  title: 'Curso Aleatorio',
                  description: '',
                  verticalSize: 7.0,
                  route: 'individual/pregunta/',
                  nextScreen: PreguntaAleatoriaScreen(),
                ),
                for (Curso curso in cursos)
                  RouterButton(
                    title: curso.nombre,
                    description: '',
                    verticalSize: 7.0,
                    route: 'individual/${curso.slug}/elegir-tema/',
                    arguments: {
                      'cursoSlug': curso.slug,
                    },
                    nextScreen: const IndividualTemaScreen(),
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