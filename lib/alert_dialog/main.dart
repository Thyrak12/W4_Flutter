import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldExample(),
    );
  }
}

class TextFieldExample extends StatelessWidget {
  TextFieldExample({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: "Enter your name",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
