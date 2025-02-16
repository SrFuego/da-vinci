import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../../domain/models/pregunta.dart';
import '../../components/route_button.dart';
import '../../controllers/solucion_aleatoria.dart';
import '../base_screen.dart';

class PreguntaPage extends StatefulWidget {
  final Pregunta pregunta;
  final FilledButton botonSaltar;
  final RouterButton botonSolucion;
  final String solucionRoute;

  const PreguntaPage({
    super.key,
    required this.pregunta,
    required this.botonSaltar,
    required this.botonSolucion,
    required this.solucionRoute,
  });

  @override
  State<PreguntaPage> createState() => _PreguntaComponentState();
}

class _PreguntaComponentState extends State<PreguntaPage> {
  int? alternativaSeleccionada;

  @override
  Widget build(BuildContext context) {
    final pregunta = widget.pregunta;
    final tema = pregunta.tema;
    final curso = tema.curso;
    final alternativas = pregunta.alternativas;

    return BaseScreen(
      title: curso.nombre,
      body: <Widget>[
        const SizedBox(height: 5.0),
        Text('${tema.nombre}:'),
        const SizedBox(height: 10.0),
        TeXView(
          child: TeXViewColumn(
            children: [
              TeXViewDocument(
                pregunta.enunciado,
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
              for (var i = 0; i < alternativas.length; i++)
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
            Column(
              children: [
                widget.botonSaltar,
                const Text(''),
                const SizedBox(height: 0),
              ],
            ),
            const SizedBox(width: 50.0),
            RouterButton(
              title: 'Enviar',
              description: '',
              verticalSize: 0.0,
              enabled: alternativaSeleccionada != null,
              route: widget.solucionRoute,
              arguments: {
                'respuestaId': alternativaSeleccionada,
              },
              nextScreen: SolucionScreen(
                respuestaId: alternativaSeleccionada != null
                    ? alternativaSeleccionada!
                    : 0,
                botonSiguientePregunta: widget.botonSolucion,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
