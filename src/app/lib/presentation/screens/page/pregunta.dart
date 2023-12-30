import 'package:flutter/material.dart';

import 'package:flutter_tex/flutter_tex.dart';

import '../../../domain/models/pregunta.dart';
import '../../controllers/solucion_aleatoria.dart';

import '../base_screen.dart';

class PreguntaPage extends StatefulWidget {
  final Pregunta pregunta;
  final FilledButton botonSaltar;
  final ElevatedButton botonSolucion;

  const PreguntaPage({
    super.key,
    required this.pregunta,
    required this.botonSaltar,
    required this.botonSolucion,
  });

  @override
  State<PreguntaPage> createState() => _PreguntaComponentState();
}

class _PreguntaComponentState extends State<PreguntaPage> {
  int? alternativaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: widget.pregunta.curso.nombre,
      body: <Widget>[
        const SizedBox(height: 5.0),
        Text(widget.pregunta.tema.nombre + (':')),
        const SizedBox(height: 10.0),
        TeXView(
          child: TeXViewColumn(
            children: [
              TeXViewDocument(
                widget.pregunta.enunciado,
                style: const TeXViewStyle(
                  textAlign: TeXViewTextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: 400,
          child: Column(
            children: [
              for (var i = 0; i < widget.pregunta.alternativas.length; i++)
                RadioListTile<int>(
                  // TODO: cambiar el Text del title por un elemento de LaTeX
                  title: Text(
                    '${String.fromCharCode(i + 97)})\t'
                    '${widget.pregunta.alternativas[i].valor}',
                  ),
                  value: widget.pregunta.alternativas[i].id,
                  groupValue: alternativaSeleccionada,
                  onChanged: (int? value) {
                    setState(
                      () {
                        alternativaSeleccionada = value;
                      },
                    );
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.botonSaltar,
            const SizedBox(width: 70.0),
            FilledButton(
              onPressed: () {
                if (alternativaSeleccionada != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SolucionScreen(
                        botonSiguientePregunta: widget.botonSolucion,
                      ),
                      settings: RouteSettings(
                        arguments: {
                          'respuestaId': alternativaSeleccionada,
                        },
                      ),
                    ),
                  );
                }
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ],
    );
  }
}
