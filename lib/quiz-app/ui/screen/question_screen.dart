import 'package:flutter/material.dart';
import 'package:w4_app/quiz-app/model/quiz_model.dart';

class QuestionScreen extends StatelessWidget {
  final Quiz quiz;
  final int index;
  final VoidCallback onChangeScreen;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.index,
    required this.onChangeScreen,
  });

  @override
  Widget build(BuildContext context) {
    final question = quiz.questions[index];

    return Scaffold(
      appBar: AppBar(title: Text("Question ${index + 1}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.title, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),

            ...question.choice.map((c) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    quiz.addAnswer(Answer(userChoice: c, question: question));
                    onChangeScreen();
                  },
                  child: Text(c),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
