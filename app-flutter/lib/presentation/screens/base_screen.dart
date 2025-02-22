import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/'),
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: body,
          ),
        ],
      ),
    );
  }
}
