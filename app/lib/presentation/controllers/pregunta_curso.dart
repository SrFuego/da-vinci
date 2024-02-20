import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
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
    final botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    final botonPreguntaIndividual = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          'individual/por_curso/',
          arguments: arguments,
        );
      },
      child: const Text('Otra Pregunta del Curso'),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaCurso(arguments['cursoSlug']),
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
