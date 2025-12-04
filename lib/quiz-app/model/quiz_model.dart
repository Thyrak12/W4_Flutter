class Question {
  final String title;
  final List<String> choice;
  final String correctChoice;

  Question({
    required this.title,
    required this.choice,
    required this.correctChoice,
  });
}

class Answer {
  final String userChoice;
  final Question question;

  Answer({
    required this.userChoice,
    required this.question,
  });

  bool isCorrect() {
    return userChoice == question.correctChoice;
  }
}

class Quiz {
  final List<Question> questions;
  List<Answer> answers = [];

  Quiz({
    required this.questions,
  });

  void addAnswer(Answer ans) {
    answers.add(ans);
  }

  int getScore() {
    int score = 0;

    for (final ans in answers) {
      if (ans.isCorrect()) {
        score++;
      }
    }

    return score;
  }

  void clearAnswers(){
    answers = [];
  }
}
