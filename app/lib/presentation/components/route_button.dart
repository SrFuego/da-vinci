import 'package:flutter/material.dart';

class RouterButton extends StatelessWidget {
  const RouterButton({
    super.key,
    required this.title,
    required this.description,
    required this.route,
    this.verticalSize = 40.0,
    this.arguments = const {},
    required this.nextScreen,
  });

  final String title;
  final String description;
  final String route;
  final double verticalSize;
  final Map<dynamic, dynamic> arguments;
  final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nextScreen,
                settings: RouteSettings(
                  name: route,
                  arguments: arguments,
                ),
              ),
            );
          },
          child: Text(title),
        ),
        Text(description),
        SizedBox(height: verticalSize),
      ],
    );
  }
}
