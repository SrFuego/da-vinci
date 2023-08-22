import 'dart:async';
import 'package:flutter/material.dart';

import 'package:da_vinci/infrastructure/models/pregunta.dart';
import 'package:da_vinci/infrastructure/repository/pregunta.dart';

enum SingingCharacter {
  alternativaA,
  alternativaB,
  alternativaC,
  alternativaD,
  alternativaE
}

class PreguntaComponent extends StatefulWidget {
  const PreguntaComponent({super.key});

  @override
  State<PreguntaComponent> createState() => _PreguntaComponentState();
}

class _PreguntaComponentState extends State<PreguntaComponent> {
  int? alternativaSeleccionada;
  Future<Pregunta>? pregunta;

  final DioClient _client = DioClient();

  @override
  void initState() {
    super.initState();
    pregunta = _client.getPregunta();
  }

  @override
  void didUpdateWidget(PreguntaComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    _client.getPregunta();
    setState(() {});
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pregunta>(
      future: pregunta,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Pregunta? pregunta = snapshot.data;
          if (pregunta != null) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(pregunta.curso.nombre),
              ),
              body: ListView(
                children: <Widget>[
                  const SizedBox(height: 15.0),
                  Center(
                    child: Text(pregunta.tema.nombre + (':')),
                  ),
                  const SizedBox(height: 25.0),
                  Center(
                    child: Text(pregunta.enunciado),
                  ),
                  const SizedBox(height: 30.0),
                  for (var alternativa in pregunta.alternativas)
                    RadioListTile<int>(
                      title: Text('a) ${alternativa.valor}'),
                      value: alternativa.id,
                      groupValue: alternativaSeleccionada,
                      onChanged: (int? value) {
                        setState(() {
                          alternativaSeleccionada = value;
                        });
                      },
                    ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FilledButton.tonal(
                        onPressed: () {
                          // _client.getPregunta();
                          // State.didUpdateWidget();
                          // didUpdateWidget();
                          setState(() {});
                        },
                        child: const Text('Saltar'),
                      ),
                      const SizedBox(width: 70.0),
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Enviar'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
