import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../presentation/screens/base_screen.dart';
import '../components/route_button.dart';
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
    final botonSaltar = FilledButton.tonal(
      onPressed: () => setState(() {}),
      child: const Text('Saltar'),
    );
    const botonPreguntaAleatoria = RouterButton(
      title: 'Curso Aleatorio',
      description: '',
      verticalSize: 7.0,
      route: 'individual/pregunta/',
      nextScreen: PreguntaAleatoriaScreen(),
    );

    return FutureBuilder(
      future: preguntaBloc.getPreguntaAleatoria(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final pregunta = snapshot.data!;
            return PreguntaPage(
              pregunta: pregunta,
              botonSaltar: botonSaltar,
              botonSolucion: botonPreguntaAleatoria,
              solucionRoute: 'individual/solucion/',
            );
          }
          return const BaseScreen(
            title: "",
            body: <Widget>[
              Placeholder(),
            ],
          );
        } else {
          return BaseScreen(
            title: "",
            body: <Widget>[
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 2 * kToolbarHeight,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
