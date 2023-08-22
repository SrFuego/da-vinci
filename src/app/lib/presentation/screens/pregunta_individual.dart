import 'package:flutter/material.dart';

import '../components/button_with_description.dart';

class PreguntaIndividual extends StatelessWidget {
  const PreguntaIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pregunta Individual'),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 80.0),
            RouterButtonWithDescription(
                title: 'Pregunta Aleatoria',
                description: 'Muestra pregunta, califica y muestra respuesta',
                route: '/individual/aleatoria'),
            SizedBox(height: 80.0),
            RouterButtonWithDescription(
                title: 'Seleccionar Curso',
                description: 'Combinados, por tema, por curso',
                route: '/individual/curso'),
          ],
        ),
      ),
    );
  }
}
