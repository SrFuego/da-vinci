import 'package:da_vinci/domain/models/solucion.dart';
import 'package:flutter/material.dart';

import '../../domain/bloc/pregunta.dart';
import '../components/solucion.dart';

class SolucionScreen extends StatefulWidget {
  const SolucionScreen({super.key, this.respuestaId});

  final int? respuestaId;

  @override
  State<SolucionScreen> createState() => _SolucionScreenState();
}

class _SolucionScreenState extends State<SolucionScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    // return Placeholder();
    // return SolucionComponent(solucion: solucion)
    // final preguntaBloc = PreguntaBloc();
    // return FutureBuilder(
    //   future:
    //       preguntaBloc.postResolverPreguntaAleatoria(widget.respuestaId ?? 10),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       print('snapshot.hasData');
    //       print(snapshot.hasData);
    //       if (snapshot.hasData) {
    //         final Solucion? solucion = snapshot.data;
    //         // Solucion solucion = Solucion.fromJson({
    //         //   "solucion": {
    //         //     "id": 3,
    //         //     "teoria": "",
    //         //     "resolucion": "Dina Boluarte",
    //         //     "pregunta": {
    //         //       "id": 3,
    //         //       "enunciado": "¿Quién ocupa la presidencia en el Perú?",
    //         //       "alternativas": [
    //         //         {"id": 11, "valor": "Dina Boluarte"},
    //         //         {"id": 12, "valor": "Ollanta Humala"},
    //         //         {"id": 13, "valor": "Alan García"},
    //         //         {"id": 10, "valor": "Pedro Castillo"}
    //         //       ],
    //         //       "tema": {"id": 3, "nombre": "Cargos Públicos"},
    //         //       "curso": {"id": 10, "nombre": "Educación Cívica"}
    //         //     },
    //         //     "alternativa_correcta": {"id": 11, "valor": "Dina Boluarte"}
    //         //   },
    //         //   "alternativa_enviada": {"id": 10, "valor": "Pedro Castillo"},
    //         //   "es_correcta": false,
    //         //   "puntaje_obtenido": -5
    //         // });
    //         print(solucion);
    //         print(solucion!.toJson());
    //         if (solucion != null) {
    //           return SolucionComponent(
    //             solucion: solucion,
    //           );
    //         } else {
    //           print('en el caso solucion == null');
    //           return const Placeholder();
    //         }
    //       }
    //       return const Placeholder();
    //     } else {
    //       return const CircularProgressIndicator();
    //     }
    //   },
    // );
    return SolucionComponent();
  }
}
