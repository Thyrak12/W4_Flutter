import 'package:flutter/material.dart';
import 'package:w4_app/quiz-app/data/quiz_data.dart';
import 'package:w4_app/quiz-app/model/quiz_model.dart';
import 'package:w4_app/quiz-app/ui/screen/start_screen.dart';
import 'package:w4_app/quiz-app/ui/screen/question_screen.dart';
import 'package:w4_app/quiz-app/ui/screen/result_screen.dart';

void main() {
  runApp(QuizApp(quiz: quizData));
}

enum QuizScreenState { start, question, result }

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizScreenState currentScreen = QuizScreenState.start;
  int questionIndex = 0;

  Quiz get quiz => widget.quiz;

  void goToStart() {
    setState(() {
      currentScreen = QuizScreenState.start;
      quiz.clearAnswers();
      questionIndex = 0;
    });
  }

  void goToQuestion() {
    setState(() {
      currentScreen = QuizScreenState.question;
    });
  }

  void goToResult() {
    setState(() {
      currentScreen = QuizScreenState.result;
    });
  }

  Widget changeScreen() {
    switch (currentScreen) {
      case QuizScreenState.start:
        return StartScreen(onStart: goToQuestion);

      case QuizScreenState.question:
        return QuestionScreen(
          quiz: quiz,
          index: questionIndex,
          onChangeScreen: () {
            if (questionIndex + 1 < quiz.questions.length) {
              setState(() => questionIndex++);
            } else {
              goToResult();
            }
          },
        );

      case QuizScreenState.result:
        return ResultScreen(quiz: quiz, onRestart: goToStart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: changeScreen(),
    );
  }
}
