import 'package:flutter/material.dart';

import 'presentation/screens/navigation/home.dart';
import 'presentation/screens/navigation/wip_grupo_de_preguntas.dart';
import 'presentation/screens/navigation/wip_examenes_pasados.dart';

void main() {
  runApp(
    const DaVinciApp(),
  );
}

class DaVinciApp extends StatefulWidget {
  const DaVinciApp({super.key});

  @override
  State<DaVinciApp> createState() => _DaVinciAppState();
}

class _DaVinciAppState extends State<DaVinciApp> {
  @override
  Widget build(BuildContext context) {
    return InheritedDaVinciState(
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
  const InheritedDaVinciState({
    super.key,
    required super.child,
  });

  static InheritedDaVinciState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedDaVinciState>();

  @override
  bool updateShouldNotify(InheritedDaVinciState oldWidget) => true;
}
