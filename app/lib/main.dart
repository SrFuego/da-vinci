import 'package:flutter/material.dart';

import 'presentation/screens/navigation/home.dart';
import 'presentation/screens/navigation/wip_grupo_de_preguntas.dart';
import 'presentation/screens/navigation/wip_examenes_pasados.dart';
import 'domain/bloc/pregunta.dart';
import 'domain/models/pregunta.dart';

void main() {
  runApp(const DaVinciApp());
}

class DaVinciApp extends StatefulWidget {
  const DaVinciApp({super.key});

  @override
  State<DaVinciApp> createState() => _DaVinciAppState();
}

class _DaVinciAppState extends State<DaVinciApp> {
  final preguntaBloc = PreguntaBloc();

  Pregunta _pregunta = Pregunta.fromJson({
    "enunciado": "¿Cuando se proclamó la independencia del Perú?",
    "alternativas": [
      {
        "id": 9,
        "valor": "1821",
      },
      {
        "id": 8,
        "valor": "1823",
      },
      {
        "id": 7,
        "valor": "1825",
      }
    ],
    "tema": {
      "nombre": "Independencia del Perú",
      "slug": "independencia-del-peru",
      "curso": {
        "nombre": "Historia del Perú",
        "slug": "historia-del-peru",
      }
    }
  });
  Pregunta get pregunta => _pregunta;

  void onPreguntaChange(Pregunta newPregunta) {
    setState(
      () {
        _pregunta = newPregunta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InheritedDaVinciState(
      pregunta: pregunta,
      onPreguntaChange: onPreguntaChange,
      child: MaterialApp(
        title: 'Problemas de Admisión en la palma de tu mano',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigoAccent,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          // Navigation
          '/': (context) => const HomeScreen(),
          // WIP
          'grupo/': (context) => const GrupoDePreguntasScreen(),
          'examenes/': (context) => const ExamenesPasadosScreen(),
        },
      ),
    );
  }
}

class InheritedDaVinciState extends InheritedWidget {
  final Pregunta pregunta;
  final void Function(Pregunta pregunta) onPreguntaChange;

  const InheritedDaVinciState({
    super.key,
    required super.child,
    required this.pregunta,
    required this.onPreguntaChange,
  });

  static InheritedDaVinciState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedDaVinciState>();

  @override
  bool updateShouldNotify(InheritedDaVinciState oldWidget) => true;
}
