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
    this.enabled = true,
  });

  final String title;
  final String description;
  final String route;
  final double verticalSize;
  final Map<dynamic, dynamic> arguments;
  final Widget nextScreen;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: enabled
              ? () {
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
                }
              : null,
          child: Text(title),
        ),
        Text(description),
        SizedBox(height: verticalSize),
      ],
    );
  }
}
