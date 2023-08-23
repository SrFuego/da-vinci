import 'package:da_vinci/presentation/components/base.dart';
import 'package:flutter/material.dart';

import '../../components/button_with_description.dart';

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
            route: '/individual/aleatoria'),
        SizedBox(height: 80.0),
        RouterButtonWithDescription(
            title: 'Seleccionar Curso',
            description: 'Combinados, por tema, por curso',
            route: '/individual/curso'),
      ],
    );
  }
}
