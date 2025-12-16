import 'package:flutter/material.dart';
import 'package:w4_app/quiz-app/model/quiz_model.dart';
import '../widgets/answer_option.dart';
import '../widgets/question_circle.dart';
import '../widgets/main_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestart,
  });

  Color getColor(bool correct) {
    return correct ? Colors.green : Colors.red;
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
            ...quiz.questions.map((q) {
              final i = quiz.questions.indexOf(q);
              final selected = quiz.answers[i].userChoice;

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionCircle(
                      index: i,
                      color: getColor(q.correctChoice == selected),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q.title, style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 5),
                        ...q.choice.map((c) {
                          return AnswerOptionRow(
                            choice: c,
                            isCorrect: c == q.correctChoice,
                            isSelected: c == selected,
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 40),
            MainButton(
              title: "Restart Quiz",
              onPressed: onRestart,
            ),
          ],
        ),
      ),
    );
  }
}
