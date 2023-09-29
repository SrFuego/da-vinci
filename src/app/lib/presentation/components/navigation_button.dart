import 'package:flutter/material.dart';

class RouterButtonWithDescription extends StatelessWidget {
  const RouterButtonWithDescription(
      {super.key,
      required this.title,
      required this.description,
      required this.route,
      this.verticalSize = 40.0});

  final String title;
  final String description;
  final String route;
  final double verticalSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text(title),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
        ),
        Text(description),
        SizedBox(height: verticalSize),
      ],
    );
  }
}
