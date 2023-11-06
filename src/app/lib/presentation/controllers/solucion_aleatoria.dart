import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/solucion.dart';

import '../screens/page/solucion.dart';

class SolucionScreen extends StatefulWidget {
  final int? respuestaId;
  final ElevatedButton botonSiguientePregunta;

  const SolucionScreen(
      {super.key, this.respuestaId, required this.botonSiguientePregunta});

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
        future: preguntaBloc
            .postResolverPreguntaAleatoria(arguments['respuestaId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final RespuestaEvaluada respuestaEvaluada = snapshot.data!;
              return SolucionPage(
                respuestaEvaluada: respuestaEvaluada,
                botonSiguientePregunta: widget.botonSiguientePregunta,
              );
            }
            return const Placeholder();
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
