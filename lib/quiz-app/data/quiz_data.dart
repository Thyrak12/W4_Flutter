import 'package:w4_app/quiz-app/model/quiz_model.dart';

final quizData = Quiz(
  questions: [
    Question(
      title: "What is the capital of France?",
      choice: ["Paris", "London", "Tokyo"],
      correctChoice: "Paris",
    ),
    Question(title: "5 + 3 = ?", choice: ["7", "8", "9"], correctChoice: "8"),
  ],
);
