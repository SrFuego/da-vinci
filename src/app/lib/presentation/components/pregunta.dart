import 'package:flutter/material.dart';

import '../../domain/models/pregunta.dart';

class PreguntaComponent extends StatefulWidget {
  const PreguntaComponent(
      {super.key, required this.pregunta, required this.botonSaltar});

  final Pregunta pregunta;
  final Widget botonSaltar;

  @override
  State<PreguntaComponent> createState() => _PreguntaComponentState();
}

class _PreguntaComponentState extends State<PreguntaComponent> {
  int? alternativaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.pregunta.curso.nombre),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15.0),
            Text(widget.pregunta.tema.nombre + (':')),
            const SizedBox(height: 25.0),
            Text(widget.pregunta.enunciado),
            const SizedBox(height: 30.0),
            for (var i = 0; i < widget.pregunta.alternativas.length; i++)
              RadioListTile<int>(
                title: Text('${String.fromCharCode(i + 97)})\t'
                    '${widget.pregunta.alternativas[i].valor}'),
                value: widget.pregunta.alternativas[i].id,
                groupValue: alternativaSeleccionada,
                onChanged: (int? value) {
                  setState(() {
                    alternativaSeleccionada = value;
                  });
                  // print("alternativa seleccionada id: $value");
                },
              ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.botonSaltar,
                const SizedBox(width: 70.0),
                FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/individual/aleatoria/solucion',
                        arguments: {'respuestaId': alternativaSeleccionada});
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
