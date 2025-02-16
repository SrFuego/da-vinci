import 'package:flutter/material.dart';

import '../../screens/navigation/individual_curso.dart';
import '../../controllers/pregunta_aleatoria.dart';
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
          title: '¡Sorpréndeme!',
          description: 'Preguntas aleatorias',
          verticalSize: 75.0,
          route: 'individual/pregunta/',
          nextScreen: PreguntaAleatoriaScreen(),
        ),
        const RouterButton(
          title: 'De una en una',
          description: 'Selecciona tu fuente de preguntas',
          verticalSize: 23.0,
          route: 'individual/elegir-curso/',
          nextScreen: IndividualCursoScreen(),
        ),
        const RedirectButton(
          title: 'Grupo de Preguntas',
          description: 'Desafío por set de preguntas',
          verticalSize: 23.0,
          route: 'grupo/',
        ),
        const RedirectButton(
          title: 'Exámenes Pasados',
          description: 'Exámenes de admisión completos',
          verticalSize: 23.0,
          route: 'examenes/',
        ),
      ],
    );
  }
}
