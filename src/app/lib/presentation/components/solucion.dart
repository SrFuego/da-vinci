import 'package:flutter/material.dart';

import '../../domain/models/solucion.dart';
import 'navigation_button.dart';

class SolucionComponent extends StatefulWidget {
  const SolucionComponent({super.key, required this.respuestaEvaluada});

  final RespuestaEvaluada respuestaEvaluada;

  @override
  State<SolucionComponent> createState() => _SolucionScreenState();
}

class _SolucionScreenState extends State<SolucionComponent> {
  @override
  Widget build(BuildContext context) {
    RespuestaEvaluada respuestaEvaluada = widget.respuestaEvaluada;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(respuestaEvaluada.solucion.pregunta.curso.nombre),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Center(
            child:
                Text("Puntaje obtenido: ${respuestaEvaluada.puntajeObtenido}"),
          ),
          const SizedBox(height: 15.0),
          Center(
            child:
                Text(respuestaEvaluada.solucion.pregunta.tema.nombre + (':')),
          ),
          const SizedBox(height: 25.0),
          Center(
            child: Text(respuestaEvaluada.solucion.pregunta.enunciado),
          ),
          const SizedBox(height: 30.0),
          for (var i = 0;
              i < respuestaEvaluada.solucion.pregunta.alternativas.length;
              i++)
            Container(
              color: respuestaEvaluada.esCorrecta &
                      (respuestaEvaluada.solucion.pregunta.alternativas[i].id ==
                          respuestaEvaluada.alternativaEnviada.id)
                  ? Colors.lightGreen
                  : (respuestaEvaluada.solucion.pregunta.alternativas[i].id ==
                          respuestaEvaluada.alternativaEnviada.id)
                      ? Colors.redAccent
                      : (respuestaEvaluada
                                  .solucion.pregunta.alternativas[i].id ==
                              respuestaEvaluada.solucion.alternativaCorrecta.id)
                          ? Colors.lightBlueAccent
                          : null,
              child: RadioListTile<int>(
                title: Text('${String.fromCharCode(i + 97)})\t'
                    '${respuestaEvaluada.solucion.pregunta.alternativas[i].valor}'),
                value: respuestaEvaluada.solucion.pregunta.alternativas[i].id,
                groupValue: respuestaEvaluada.esCorrecta
                    ? respuestaEvaluada.alternativaEnviada.id
                    : respuestaEvaluada.solucion.alternativaCorrecta.id,
                onChanged: (int? value) {
                  // setState(() {});
                },
              ),
            ),
          Center(
              child: Column(children: [
            const Text("Solución"),
            const SizedBox(height: 25.0),
            Text("Resolucion: ${respuestaEvaluada.solucion.resolucion}"),
            const SizedBox(height: 15.0),
            Text("Teoría: ${respuestaEvaluada.solucion.teoria}"),
            const SizedBox(height: 40.0),
            const RouterButtonWithDescription(
                title: 'Otra Pregunta Aleatoria',
                description: '',
                route: '/individual/aleatoria')
          ])),
        ],
      ),
    );
  }
}
