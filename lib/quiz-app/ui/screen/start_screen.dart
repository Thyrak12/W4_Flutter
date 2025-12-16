import 'package:flutter/material.dart';
import '../widgets/main_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Quiz!",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            MainButton(
              title: "Start",
              onPressed: onStart,
            ),
          ],
        ),
      ),
    );
  }
}
