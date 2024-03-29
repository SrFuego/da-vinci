import 'package:flutter/material.dart';

import '../../../domain/bloc/tema.dart';
import '../../../domain/models/tema.dart';
import '../../controllers/pregunta_tema.dart';
import '../../controllers/pregunta_curso.dart';
import '../../components/route_button.dart';
import '../base_screen.dart';

class IndividualTemaScreen extends StatefulWidget {
  const IndividualTemaScreen({super.key});

  @override
  State<IndividualTemaScreen> createState() => _IndividualTemaScreenState();
}

class _IndividualTemaScreenState extends State<IndividualTemaScreen> {
  @override
  Widget build(BuildContext context) {
    final temaBloc = TemaBloc();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final cursoSlug = arguments['cursoSlug'];
    final cursoNombre = arguments['cursoNombre'];

    return FutureBuilder(
      future: temaBloc.getTemas(cursoSlug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // if (snapshot.hasData) {
          final List<Tema> temas = snapshot.data!;
          return BaseScreen(
            title: snapshot.hasData ? 'Temas de $cursoNombre' : "API error",
            body: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 40.0),
                  RouterButton(
                    title: 'Tema Aleatorio',
                    description: '',
                    verticalSize: 7.0,
                    arguments: {
                      'cursoSlug': cursoSlug,
                    },
                    route: 'individual/$cursoSlug/pregunta/',
                    nextScreen: const PreguntaIndividualCursoScreen(),
                  ),
                  for (Tema tema in temas)
                    RouterButton(
                      title: tema.nombre,
                      description: '',
                      verticalSize: 7.0,
                      route: 'individual/${tema.slug}/pregunta/',
                      arguments: {
                        'temaSlug': tema.slug,
                      },
                      nextScreen: const PreguntaIndividualTemaScreen(),
                    ),
                ],
              ),
            ],
          );
        } else {
          return BaseScreen(
            title: "",
            body: <Widget>[
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 2 * kToolbarHeight,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
