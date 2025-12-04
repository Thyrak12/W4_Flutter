import 'package:flutter/material.dart';
import 'package:w4_app/quiz-app/model/quiz_model.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestart,
  });

  Color getColor(bool isCorrect){
    return isCorrect ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final score = quiz.getScore();

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Result")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Your Score: $score / ${quiz.questions.length}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),

            ...quiz.questions.map((question) {
              final i = quiz.questions.indexOf(question);
              final userAnswer = quiz.answers[i].userChoice;

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionCircle(questionIndex: i, color: getColor(question.correctChoice == userAnswer)),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                  
                        ...question.choice.map((c) {
                          IconData iconData;
                          Color color;
                    
                          if (c == question.correctChoice) {
                            iconData = Icons.check_circle;
                            color = Colors.green;
                          } else if (c == userAnswer) {
                            iconData = Icons.cancel;
                            color = Colors.red;
                          } else {
                            iconData = Icons.circle_outlined;
                            color = Colors.grey;
                          }
                    
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Icon(iconData, color: color),
                                const SizedBox(width: 8),
                                Text(
                                  c,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: color,
                                    fontWeight: c == question.correctChoice
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: onRestart,
              child: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCircle extends StatelessWidget {
  final int questionIndex;
  final Color color;

  const QuestionCircle({
    super.key,
    required this.questionIndex,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: Text(
        '${questionIndex + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

