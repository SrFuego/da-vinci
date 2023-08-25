import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/pregunta.dart';

import '../components/pregunta.dart';

class PreguntaAleatoriaScreen extends StatefulWidget {
  const PreguntaAleatoriaScreen({super.key});

  @override
  State<PreguntaAleatoriaScreen> createState() =>
      _PreguntaAleatoriaScreenState();
}

class _PreguntaAleatoriaScreenState extends State<PreguntaAleatoriaScreen> {
  @override
  Widget build(BuildContext context) {
    final preguntaBloc = PreguntaBloc();
    Widget botonesDeAccion = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FilledButton.tonal(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Saltar'),
        ),
        const SizedBox(width: 70.0),
        FilledButton(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Enviar'),
        ),
      ],
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaAleatoria(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final Pregunta? pregunta = snapshot.data;
            if (pregunta != null) {
              return PreguntaComponent(
                pregunta: pregunta,
                botonesdeaccion: botonesDeAccion,
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
