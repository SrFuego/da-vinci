import 'package:flutter/material.dart';

import '../../components/navigation_button.dart';
import '../../components/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Problemas de Admisión',
      body: <Widget>[
        Image.asset('assets/logo.jpg'),
        const RouterButtonWithDescription(
            title: 'Pregunta Individual',
            description: 'Muestra preguntas 1x1',
            route: '/individual'),
        const RouterButtonWithDescription(
            title: 'Grupo de Preguntas',
            description: 'Set de Preguntas',
            route: '/grupo'),
        const RouterButtonWithDescription(
            title: 'Exámenes Pasados',
            description: 'Exámenes de admisión completos',
            route: '/examenes'),
      ],
    );
  }
}
