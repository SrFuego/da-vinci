import 'package:flutter/material.dart';

import 'presentation/screens/navigation/home.dart';
import 'presentation/screens/navigation/pregunta_individual.dart';
import 'presentation/screens/grupo_de_preguntas.dart';
import 'presentation/screens/examenes_pasados.dart';
import 'presentation/screens/seleccionar_curso.dart';
import 'presentation/screens/pregunta_aleatoria.dart';

void main() {
  runApp(const DaVinciApp());
}

class DaVinciApp extends StatelessWidget {
  const DaVinciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/individual/curso': (context) => const SeleccionarCursoScreen(),
        '/grupo': (context) => const GrupoDePreguntasScreen(),
        '/examenes': (context) => const ExamenesPasadosScreen(),
      },
    );
  }
}
