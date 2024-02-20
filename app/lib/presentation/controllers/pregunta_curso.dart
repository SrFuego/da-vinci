import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
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
    final botonPreguntaIndividual = RouterButton(
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
        // print("en la cosa de su cosita");
        // print(Uri.base.toString());
        // print(Uri.base.query);
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final pregunta = snapshot.data!;
            return PreguntaPage(
              pregunta: pregunta,
              botonSaltar: botonSaltar,
              botonSolucion: botonPreguntaIndividual,
              solucionRoute: 'individual/$cursoSlug/solucion/',
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
