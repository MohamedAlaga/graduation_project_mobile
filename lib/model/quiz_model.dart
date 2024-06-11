
class QuizQuestion {
  String ? questionId ;
  String ? questionText;
  String ? answerOneId ;
  String ? answerOneText ;
  String ? answerOneIsCorrect;
  String ? answerTwoId ;
  String ? answerTwoText ;
  String ? answerTwoIsCorrect;
  String ? answerThreeId ;
  String ? answerThreeText ;
  String ? answerThreeIsCorrect;
  String ? userSelectedAnswerId;


  Map<String,dynamic> toJson (){
    return {'question_id' : int.parse(questionId.toString()),
      'answer_id' : int.parse(userSelectedAnswerId.toString())
    };
  }

  QuizQuestion({
    this.questionId,
    this.questionText,
    this.answerOneId,
    this.answerOneText,
    this.answerOneIsCorrect,
    this.answerTwoId,
    this.answerTwoText,
    this.answerTwoIsCorrect,
    this.answerThreeId,
    this.answerThreeText,
    this.answerThreeIsCorrect});
}












List<QuizQuestion> q = [
  QuizQuestion(
    questionId: "1",
    questionText: "What is the capital of France?",
    answerOneId: "1",
    answerOneText: "Paris",
    answerOneIsCorrect: "1",
    answerTwoId: "2",
    answerTwoText: "London",
    answerTwoIsCorrect: "0",
    answerThreeId: "3",
    answerThreeText: "Berlin",
    answerThreeIsCorrect: "0",
  ),
  QuizQuestion(
    questionId: "2",
    questionText: "What is 2 + 2?",
    answerOneId: "1",
    answerOneText: "3",
    answerOneIsCorrect: "0",
    answerTwoId: "2",
    answerTwoText: "4",
    answerTwoIsCorrect: "1",
    answerThreeId: "3",
    answerThreeText: "5",
    answerThreeIsCorrect: "0",
  )
];








