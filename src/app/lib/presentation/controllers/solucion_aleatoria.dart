import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../../domain/models/solucion.dart';

import '../controllers/pregunta_aleatoria.dart';

import '../screens/page/solucion.dart';

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
    final ElevatedButton botonPreguntaAleatoria = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PreguntaAleatoriaScreen(),
          ),
        );
      },
      child: const Text('Otra Pregunta Aleatoria'),
    );

    return FutureBuilder(
        future: preguntaBloc
            .postResolverPreguntaAleatoria(arguments['respuestaId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final RespuestaEvaluada respuestaEvaluada = snapshot.data!;
              return SolucionPage(
                respuestaEvaluada: respuestaEvaluada,
                siguientePregunta: botonPreguntaAleatoria,
              );
            }
            return const Placeholder();
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
