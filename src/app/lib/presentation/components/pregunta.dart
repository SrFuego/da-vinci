// import 'package:da_vinci/main.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/models/pregunta.dart';
// import '../../application/bloc/pregunta.dart';

// class PreguntaComponent extends StatefulWidget {
//   const PreguntaComponent({super.key});

//   @override
//   State<PreguntaComponent> createState() => _PreguntaComponentState();
// }

// class _PreguntaComponentState extends State<PreguntaComponent> {
//   int? alternativaSeleccionada;
//   final preguntaBloc = PreguntaBloc();
//   // Future<Pregunta>? pregunta;

//   @override
//   Widget build(BuildContext context) {
//     // return FutureBuilder<Pregunta>(
//     return WidgetBuilder<Pregunta>(
//       future: preguntaBloc.pregunta,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           Pregunta? pregunta = snapshot.data;
//           if (pregunta != null) {
//             return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//                 title: Text(pregunta.curso.nombre),
//               ),
//               body: ListView(
//                 children: <Widget>[
//                   const SizedBox(height: 15.0),
//                   Center(
//                     child: Text(pregunta.tema.nombre + (':')),
//                   ),
//                   const SizedBox(height: 25.0),
//                   Center(
//                     child: Text(pregunta.enunciado),
//                   ),
//                   const SizedBox(height: 30.0),
//                   for (var i = 0; i < pregunta.alternativas.length; i++)
//                     RadioListTile<int>(
//                       title: Text('${String.fromCharCode(i + 97)})\t'
//                           '${pregunta.alternativas[i].valor}'),
//                       value: pregunta.alternativas[i].id,
//                       groupValue: alternativaSeleccionada,
//                       onChanged: (int? value) {
//                         setState(() {
//                           alternativaSeleccionada = value;
//                         });
//                       },
//                     ),
//                   const SizedBox(height: 50.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       FilledButton.tonal(
//                         onPressed: () {
//                           // _client.getPregunta();
//                           // State.didUpdateWidget();
//                           // didUpdateWidget();
//                           setState(() {});
//                         },
//                         child: const Text('Saltar'),
//                       ),
//                       const SizedBox(width: 70.0),
//                       FilledButton(
//                         onPressed: () {},
//                         child: const Text('Enviar'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

class PreguntaComponent extends StatefulWidget {
  final Pregunta pregunta;
  final Widget botonesdeaccion;

  const PreguntaComponent(
      {super.key, required this.pregunta, required this.botonesdeaccion});

  @override
  State<PreguntaComponent> createState() => _PreguntaComponentState();
}

class _PreguntaComponentState extends State<PreguntaComponent> {
  int? alternativaSeleccionada;

  // final preguntaBloc = PreguntaBloc();
  // Future<Pregunta>? pregunta;

  // _PreguntaComponentState({
  //   super.key,
  //   required this.pregunta,
  //   // required this.onPreguntaChange,
  // });

  // const PreguntaComponent({super.key});
  // final preguntaBloc = PreguntaBloc();
  // Future<Pregunta>? pregunta;

  @override
  Widget build(BuildContext context) {
    // print(widget.pregunta);
    // if (widget.pregunta != null) {
    //   Pregunta? pregunta = widget.pregunta;
    // } else {
    //   Pregunta? pregunta = InheritedDaVinciState.of(context)?.pregunta;
    // }
    // return FutureBuilder<Pregunta>(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.pregunta.curso.nombre),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Center(
            child: Text(widget.pregunta.tema.nombre + (':')),
          ),
          const SizedBox(height: 25.0),
          Center(
            child: Text(widget.pregunta.enunciado),
          ),
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
              },
            ),
          const SizedBox(height: 50.0),
          widget.botonesdeaccion
        ],
      ),
    );
  }
}
