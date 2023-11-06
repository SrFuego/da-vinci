import 'package:flutter/material.dart';

import '../../components/route_button.dart';
import '../base_screen.dart';

class PreguntaIndividualScreen extends StatelessWidget {
  const PreguntaIndividualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Pregunta Individual',
      body: <Widget>[
        SizedBox(height: 80.0),
        RouterButtonWithDescription(
            title: 'Pregunta Aleatoria',
            description: 'Muestra pregunta, califica y muestra respuesta',
            route: 'individual/aleatoria/'),
        SizedBox(height: 80.0),
        RouterButtonWithDescription(
            title: 'Seleccionar Curso',
            description: 'Combinados, por tema, por curso',
            route: 'individual/seleccionar_curso/'),
      ],
    );
  }
}
