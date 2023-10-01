import 'package:flutter/material.dart';

import 'presentation/screens/navigation/home.dart';
import 'presentation/screens/navigation/pregunta_individual.dart';

import 'presentation/screens/wip/grupo_de_preguntas.dart';
import 'presentation/screens/wip/examenes_pasados.dart';

import 'presentation/screens/pregunta_individual.dart';
import 'presentation/screens/seleccionar_curso.dart';
import 'presentation/screens/pregunta_aleatoria.dart';
import 'presentation/screens/solucion_pregunta.dart';

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
    "id": 2,
    "enunciado": "¿Cuando se proclamó la independencia del Perú?",
    "alternativas": [
      {"id": 7, "valor": "1825"},
      {"id": 9, "valor": "1821"},
      {"id": 8, "valor": "1823"}
    ],
    "tema": {"id": 2, "nombre": "Independencia del Perú"},
    "curso": {"id": 11, "nombre": "Historia del Perú"}
  });
  Pregunta get pregunta => _pregunta;

  void onPreguntaChange(Pregunta newPregunta) {
    setState(() {
      _pregunta = newPregunta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedDaVinciState(
      pregunta: pregunta,
      onPreguntaChange: onPreguntaChange,
      child: MaterialApp(
        title: 'Problemas de Admisión en la palma de tu mano',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/individual': (context) => const PreguntaIndividualScreen(),
          '/individual/aleatoria': (context) => const PreguntaAleatoriaScreen(),
          '/individual/aleatoria/solucion': (context) => const SolucionScreen(),
          '/individual/por_curso/': (context) =>
              const PreguntaIndividualCursoScreen(),
          '/individual/curso': (context) => const SeleccionarCursoScreen(),
          '/grupo': (context) => const GrupoDePreguntasScreen(),
          '/examenes': (context) => const ExamenesPasadosScreen(),
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
