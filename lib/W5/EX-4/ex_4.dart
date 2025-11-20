import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 150, 227, 73),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [ScoreCard(), const SizedBox(height: 20), ScoreCard()],
          ),
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int currentScore = 0;

  void addScore() {
    setState(() {
      if (currentScore < 10) currentScore++;
    });
  }

  void removeScore() {
    setState(() {
      if (currentScore > 0) currentScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.lerp(
      Colors.green[100],
      Colors.green[900],
      currentScore / 10,
    )!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("My score in Flutter", style: TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: removeScore,
                  icon: const Icon(Icons.remove),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: addScore,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: constraints.maxWidth * (currentScore / 10),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: currentColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
