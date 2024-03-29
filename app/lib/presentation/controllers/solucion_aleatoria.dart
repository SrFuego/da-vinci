import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../presentation/screens/base_screen.dart';
import '../components/route_button.dart';
import '../screens/page/solucion.dart';

class SolucionScreen extends StatefulWidget {
  final int respuestaId;
  final RouterButton botonSiguientePregunta;

  const SolucionScreen({
    super.key,
    required this.respuestaId,
    required this.botonSiguientePregunta,
  });

  @override
  State<SolucionScreen> createState() => _SolucionScreenState();
}

class _SolucionScreenState extends State<SolucionScreen> {
  @override
  Widget build(BuildContext context) {
    final preguntaBloc = PreguntaBloc();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return FutureBuilder(
      future: preguntaBloc.postResolverPreguntaAleatoria(
        arguments['respuestaId'],
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final respuestaEvaluada = snapshot.data!;
            return SolucionPage(
              respuestaEvaluada: respuestaEvaluada,
              botonSiguientePregunta: widget.botonSiguientePregunta,
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
