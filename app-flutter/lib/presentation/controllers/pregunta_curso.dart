import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../presentation/screens/base_screen.dart';
import '../components/route_button.dart';
import '../screens/page/pregunta.dart';

class PreguntaIndividualCursoScreen extends StatefulWidget {
  const PreguntaIndividualCursoScreen({super.key});

  @override
  State<PreguntaIndividualCursoScreen> createState() =>
      _PreguntaIndividualCursoScreenState();
}

class _PreguntaIndividualCursoScreenState
    extends State<PreguntaIndividualCursoScreen> {
  @override
  Widget build(BuildContext context) {
    final preguntaBloc = PreguntaBloc();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final cursoSlug = arguments['cursoSlug'];
    final botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    final botonPreguntaDelCurso = RouterButton(
      title: 'Otra Pregunta del Curso',
      description: '',
      verticalSize: 7.0,
      route: 'individual/$cursoSlug/pregunta/',
      arguments: arguments,
      nextScreen: const PreguntaIndividualCursoScreen(),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaCurso(cursoSlug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final pregunta = snapshot.data!;
            return PreguntaPage(
              pregunta: pregunta,
              botonSaltar: botonSaltar,
              botonSolucion: botonPreguntaDelCurso,
              solucionRoute: 'individual/$cursoSlug/solucion/',
            );
          }
          return const BaseScreen(
            title: "",
            body: <Widget>[
              Placeholder(),
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
