import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../../domain/models/respuestaEvaluada.dart';
import '../base_screen.dart';

class SolucionPage extends StatefulWidget {
  final RespuestaEvaluada respuestaEvaluada;
  final ElevatedButton botonSiguientePregunta;

  const SolucionPage({
    super.key,
    required this.respuestaEvaluada,
    required this.botonSiguientePregunta,
  });

  @override
  State<SolucionPage> createState() => _SolucionScreenState();
}

class _SolucionScreenState extends State<SolucionPage> {
  @override
  Widget build(BuildContext context) {
    final respuesta = widget.respuestaEvaluada;
    final pregunta = respuesta.solucion.pregunta;

    print("en la solucion");
    print("pregunta.enunciado");
    print(pregunta.enunciado);
    print("respuesta.solucion.teoria");
    print(respuesta.solucion.teoria);

    return BaseScreen(
      title: pregunta.tema.curso.nombre,
      body: <Widget>[
        const SizedBox(height: 20.0),
        Center(
          child: Text(
            "Puntaje obtenido: "
            "${respuesta.puntajeObtenido}",
          ),
        ),
        const SizedBox(height: 15.0),
        Center(
          child: Text(
            "${pregunta.tema.nombre} :",
          ),
        ),
        const SizedBox(height: 25.0),
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
        const SizedBox(height: 7.0),
        SizedBox(
          width: 400,
          child: Column(
            children: [
              for (var i = 0; i < pregunta.alternativas.length; i++)
                Container(
                  color: respuesta.esCorrecta &
                          (pregunta.alternativas[i].id ==
                              respuesta.alternativaEnviada.id)
                      ? Colors.lightGreen
                      : (pregunta.alternativas[i].id ==
                              respuesta.alternativaEnviada.id)
                          ? Colors.redAccent
                          : (pregunta.alternativas[i].id ==
                                  respuesta.solucion.alternativaCorrecta.id)
                              ? Colors.lightBlueAccent
                              : null,
                  child: RadioListTile<int>(
                    title: Text(
                      '${String.fromCharCode(i + 97)})\t'
                      '${pregunta.alternativas[i].valor}',
                    ),
                    value: pregunta.alternativas[i].id,
                    groupValue: respuesta.esCorrecta
                        ? respuesta.alternativaEnviada.id
                        : respuesta.solucion.alternativaCorrecta.id,
                    onChanged: (int? value) {
                      // setState(() {});
                    },
                  ),
                ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                const SizedBox(height: 25.0),
                const Text("Solución:"),
                const SizedBox(height: 7.0),
                TeXView(
                  child: TeXViewColumn(
                    children: [
                      TeXViewDocument(
                        respuesta.solucion.teoria,
                        style: const TeXViewStyle(
                          textAlign: TeXViewTextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                const Text("Resolución:"),
                const SizedBox(height: 7.0),
                TeXView(
                  child: TeXViewColumn(
                    children: [
                      TeXViewDocument(
                        respuesta.solucion.resolucion,
                        style: const TeXViewStyle(
                          textAlign: TeXViewTextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                widget.botonSiguientePregunta,
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
