import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';
// import 'W8_Practice/EXERCISE-2/ui/screens/temperature_screen.dart';
// import 'W8_Practice/EXERCISE-2/ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool showWelcome = true;
  double result = 0;

  void switchScreen() {
    setState(() {
      showWelcome = false;
    });
  }

  ValueChanged<String> onChangeText() {
    return (value) {
      setState(() {
        double celsius = double.tryParse(value) ?? 0;
        result = (celsius * 9 / 5) + 32;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: showWelcome
              ? WelcomeScreen(changeScreen: switchScreen)
              : TemperatureScreen(
                  changeInput: onChangeText(),
                  resultText: result.toStringAsFixed(2),
                ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
