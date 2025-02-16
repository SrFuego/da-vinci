import 'package:flutter/material.dart';

class RedirectButton extends StatelessWidget {
  const RedirectButton({
    super.key,
    required this.title,
    required this.description,
    required this.route,
    this.verticalSize = 40.0,
    this.arguments = const {},
  });

  final String title;
  final String description;
  final String route;
  final double verticalSize;
  final Map<String, dynamic> arguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              route,
              arguments: arguments,
            );
          },
          child: Text(title),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 12.0),
        ),
        SizedBox(height: verticalSize),
      ],
    );
  }
}
