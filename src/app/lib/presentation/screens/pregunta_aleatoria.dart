import 'package:flutter/material.dart';

import '../../main.dart';
import '../../application/bloc/pregunta.dart';
import '../components/pregunta.dart';
import '../../infrastructure/models/pregunta.dart';

class PreguntaAleatoriaScreen extends StatefulWidget {
  const PreguntaAleatoriaScreen({super.key});

  @override
  State<PreguntaAleatoriaScreen> createState() =>
      _PreguntaAleatoriaScreenState();
}

class _PreguntaAleatoriaScreenState extends State<PreguntaAleatoriaScreen> {
  // void onPreguntaChange(Pregunta newPregunta) {
  //   setState(() {
  //     _pregunta = newPregunta;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // PreguntaBloc preguntaBloc = preguntaBloc();
    final preguntaBloc = PreguntaBloc();
    Pregunta pregunta = InheritedDaVinciState.of(context)!.pregunta;
    Widget botonesDeAccion = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FilledButton.tonal(
          onPressed: () {
            // _client.getPregunta();
            // State.didUpdateWidget();
            // didUpdateWidget();
            // setState(() {});
            // pregunta = preguntaBloc.getPreguntaAleatoria();
            InheritedDaVinciState.of(context)!
                .onPreguntaChange(preguntaBloc.getPreguntaAleatoria());
            setState(() {});
          },
          child: const Text('Saltar'),
        ),
        const SizedBox(width: 70.0),
        FilledButton(
          onPressed: () {
            Pregunta pregunta = Pregunta.fromJson({
              "id": 2,
              "enunciado": "¿Cuando se proclamó la independencia del Perú?",
              "alternativas": [
                {"id": 7, "valor": "1825"},
                {"id": 9, "valor": "1821"},
                {"id": 8, "valor": "1823"}
              ],
              "tema": {"id": 2, "nombre": "Independencia del Perú"},
              "curso": {"id": 11, "nombre": "Historia del Perú"}
            });
            InheritedDaVinciState.of(context)!.onPreguntaChange(pregunta);
            setState(() {});
          },
          child: const Text('Enviar'),
        ),
      ],
    );

    return PreguntaComponent(
      pregunta: pregunta,
      botonesdeaccion: botonesDeAccion,
    );
  }
}
