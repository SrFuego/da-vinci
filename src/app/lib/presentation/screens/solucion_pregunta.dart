import 'package:da_vinci/domain/models/solucion.dart';
import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../components/solucion.dart';

class SolucionScreen extends StatefulWidget {
  const SolucionScreen({super.key, this.respuestaId});

  final int? respuestaId;

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
              final RespuestaEvaluada? respuestaEvaluada = snapshot.data;
              if (respuestaEvaluada != null) {
                return SolucionComponent(
                  respuestaEvaluada: respuestaEvaluada,
                );
              } else {
                return const Placeholder();
              }
            }
            return const Placeholder();
          } else {
            return const CircularProgressIndicator();
          }
          // return SolucionComponent(respuestaEvaluada: respuestaEvaluada);
        });
  }
}
