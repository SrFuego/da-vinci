import 'package:flutter/material.dart';

import '../../../domain/bloc/tema.dart';
import '../../../domain/models/tema.dart';
import '../../components/route_button.dart';
import '../base_screen.dart';

class IndividualTemaScreen extends StatefulWidget {
  const IndividualTemaScreen({super.key});

  @override
  State<IndividualTemaScreen> createState() => _IndividualTemaScreenState();
}

class _IndividualTemaScreenState extends State<IndividualTemaScreen> {
  @override
  Widget build(BuildContext context) {
    final temaBloc = TemaBloc();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final cursoId = arguments['cursoId'];

    return FutureBuilder(
      future: temaBloc.getTemas(cursoId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<Tema> temas = snapshot.data!;
            return BaseScreen(
              title: 'Pregunta Individual',
              body: <Widget>[
                const SizedBox(height: 40.0),
                RouterButtonWithDescription(
                  title: 'Tema Aleatorio',
                  description: '',
                  verticalSize: 7.0,
                  arguments: {'cursoId': cursoId},
                  route: 'individual/por_curso/',
                ),
                // const SizedBox(height: 10.0),
                for (Tema tema in temas)
                  RouterButtonWithDescription(
                    title: tema.nombre,
                    description: '',
                    verticalSize: 7.0,
                    arguments: {'temaId': tema.id},
                    route: 'individual/por_tema/',
                  ),
              ],
            );
          }
          return const Placeholder();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
