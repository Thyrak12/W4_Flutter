import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int activeNumber = 1;
  String activeDiceImage = 'assets/dice/dice-1.png';
  Random random = Random();
  
  void rollDice() {
    //  Display the dice 4 !
    setState(() {
      activeNumber = random.nextInt(6) + 1;
      activeDiceImage = 'assets/dice/dice-$activeNumber.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);
