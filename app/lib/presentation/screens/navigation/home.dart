import 'package:flutter/material.dart';

import '../../screens/navigation/individual_curso.dart';
import '../../components/redirect_button.dart';
import '../../components/route_button.dart';
import '../base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Problemas de Admisión',
      body: <Widget>[
        Image.asset('assets/logo.jpg'),
        const RouterButton(
          title: 'Pregunta Individual',
          description: 'Muestra preguntas 1x1',
          route: 'individual/elegir-curso/',
          nextScreen: IndividualCursoScreen(),
        ),
        const RedirectButton(
          title: 'Grupo de Preguntas',
          description: 'Set de Preguntas',
          route: 'grupo/',
        ),
        const RedirectButton(
          title: 'Exámenes Pasados',
          description: 'Exámenes de admisión completos',
          route: 'examenes/',
        ),
      ],
    );
  }
}
