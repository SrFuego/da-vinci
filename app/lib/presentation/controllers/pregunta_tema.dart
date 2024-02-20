import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../components/route_button.dart';
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
    final temaSlug = arguments['temaSlug'];
    final botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    final botonPreguntaIndividual = RouterButton(
      title: 'Otra Pregunta del Tema',
      description: '',
      verticalSize: 7.0,
      arguments: {'temaSlug': temaSlug},
      route: 'individual/$temaSlug/pregunta/',
      nextScreen: const PreguntaIndividualTemaScreen(),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaTema(temaSlug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final pregunta = snapshot.data!;
            return PreguntaPage(
              pregunta: pregunta,
              botonSaltar: botonSaltar,
              botonSolucion: botonPreguntaIndividual,
              solucionRoute: 'individual/$temaSlug/solucion/',
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
