import 'package:flutter/material.dart';

import '../components/button_with_description.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Problemas de Admisión'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('assets/logo.jpg'),
            const RouterButtonWithDescription(
                title: 'Pregunta Individual',
                description: 'Muestra preguntas 1x1',
                route: '/individual'),
            const SizedBox(height: 40.0),
            const RouterButtonWithDescription(
                title: 'Grupo de Preguntas',
                description: 'Set de Preguntas',
                route: '/grupo'),
            const SizedBox(height: 40.0),
            const RouterButtonWithDescription(
                title: 'Exámenes Pasados',
                description: 'Exámenes de admisión completos',
                route: '/examenes'),
          ],
        ),
      ),
    );
  }
}
