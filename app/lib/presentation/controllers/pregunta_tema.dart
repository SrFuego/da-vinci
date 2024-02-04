import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/pregunta.dart';
import '../screens/page/pregunta.dart';

class PreguntaIndividualTemaScreen extends StatefulWidget {
  const PreguntaIndividualTemaScreen({super.key});

  @override
  State<PreguntaIndividualTemaScreen> createState() =>
      _PreguntaIndividualTemaScreenState();
}

class _PreguntaIndividualTemaScreenState
    extends State<PreguntaIndividualTemaScreen> {
  @override
  Widget build(BuildContext context) {
    final preguntaBloc = PreguntaBloc();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final FilledButton botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    final ElevatedButton botonPreguntaIndividual = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          'individual/por_tema/',
          arguments: arguments,
        );
      },
      child: const Text('Otra Pregunta del Tema'),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaTema(arguments['temaId']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final Pregunta pregunta = snapshot.data!;
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
