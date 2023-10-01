import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/pregunta.dart';

import '../components/pregunta.dart';

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
    Widget botonSaltar = FilledButton.tonal(
      onPressed: () {
        setState(() {});
      },
      child: const Text('Saltar'),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaCurso(arguments['curso']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final Pregunta? pregunta = snapshot.data;
            if (pregunta != null) {
              return PreguntaComponent(
                pregunta: pregunta,
                botonSaltar: botonSaltar,
              );
            } else {
              return const Placeholder();
            }
          }
          return const Placeholder();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
