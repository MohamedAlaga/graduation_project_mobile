import 'dart:convert';
import 'package:aabkr/env_globals.dart';
import 'package:aabkr/model/quiz_model.dart';
import 'package:http/http.dart' as http;

getQuizAnswer(String token) async {
    var userData = await http.get(
      Uri.parse(
        '$domainName/api/user-tests/1/answers',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding' : 'gzip, deflate, br',
        'Connection' : 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (userData.statusCode != 200) {
      return 0 ;
    }
    Map<String,dynamic> response = jsonDecode(userData.body);
    List<dynamic> userAnswers = response["data"]["user_test_answers"];
    percentage = double.parse(response["data"]["percentage"].toString()) ;
    List<QuizQuestion> quizAnswer = [];
    for ( var answer in userAnswers)
    {
      for (QuizQuestion tempQues in allQuestions) {
        if (tempQues.questionId == answer["question_id"].toString()) {
          tempQues.userSelectedAnswerId = answer["answer_id"].toString();
          quizAnswer.add(tempQues);
          print("${answer["question_id"].toString()} + ${answer["answer_id"].toString()}");
        }
    }}
    answerdQuiz = quizAnswer;
  return answerdQuiz;

}
