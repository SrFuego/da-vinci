import 'package:da_vinci/presentation/components/navigation_button.dart';
import 'package:flutter/material.dart';

import '../../domain/models/solucion.dart';
import '../components/base_screen.dart';

class SolucionComponent extends StatefulWidget {
  // const SolucionComponent({super.key, required this.solucion});
  const SolucionComponent({super.key});

  // final Solucion solucion;

  @override
  State<SolucionComponent> createState() => _SolucionScreenState();
}

class _SolucionScreenState extends State<SolucionComponent> {
  @override
  Widget build(BuildContext context) {
    RespuestaEvaluada respuestaEvaluada = RespuestaEvaluada.fromJson({
      "solucion": {
        "id": 1,
        "teoria": "",
        "resolucion":
            "Se pasan los números a unidades, 2 + 2 pasa a ser 1 + 1 + 1 + 1, entonces sumaria 4 unidades",
        "pregunta": {
          "id": 1,
          "enunciado": "¿Cuánto es 2 + 2?",
          "alternativas": [
            {"id": 4, "valor": "6"},
            {"id": 2, "valor": "4"},
            {"id": 5, "valor": "7"},
            {"id": 1, "valor": "3"},
            {"id": 3, "valor": "5"}
          ],
          "tema": {"id": 1, "nombre": "Operaciones combinadas"},
          "curso": {"id": 5, "nombre": "Álgebra"}
        },
        "alternativa_correcta": {"id": 2, "valor": "4"}
      },
      "alternativa_enviada": {"id": 5, "valor": "7"},
      "es_correcta": false,
      "puntaje_obtenido": 20.0
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: const Text("Solución"),
        title: Text(respuestaEvaluada.solucion.pregunta.curso.nombre),
        // title: Text(widget.solucion.solucion.pregunta.curso.nombre),
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

          // const SizedBox(height: 50.0),
          // widget.botonesdeaccion
          Center(
              child: Column(children: [
            const Text("Solución"),
            Text("Resolucion: ${respuestaEvaluada.solucion.resolucion}"),
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
