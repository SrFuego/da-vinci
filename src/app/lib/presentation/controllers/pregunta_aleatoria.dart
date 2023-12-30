import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/pregunta.dart';

import '../screens/page/pregunta.dart';

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
    final FilledButton botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    final ElevatedButton botonPreguntaAleatoria = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PreguntaAleatoriaScreen(),
          ),
        );
      },
      child: const Text('Otra Pregunta Aleatoria'),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaAleatoria(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final Pregunta pregunta = snapshot.data!;
            return PreguntaPage(
              pregunta: pregunta,
              botonSaltar: botonSaltar,
              botonSolucion: botonPreguntaAleatoria,
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
