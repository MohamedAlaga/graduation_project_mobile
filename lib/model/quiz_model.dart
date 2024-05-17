class Test {
  int id;
  String title;
  int courseId;
  int timeLimit;
  List<Question> questions;

  Test({
    required this.id,
    required this.title,
    required this.courseId,
    required this.timeLimit,
    required this.questions,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      timeLimit: json['time_limit'],
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}

class Question {
  int id;
  String text;
  List<Answer> answers;

  Question({
    required this.id,
    required this.text,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      answers: (json['answers'] as List)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList(),
    );
  }
}

class Answer {
  int id;
  String text;
  bool isCorrect;

  Answer({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      text: json['text'],
      isCorrect: json['is_correct'] == 1,
    );
  }
}
