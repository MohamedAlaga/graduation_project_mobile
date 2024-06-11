import 'dart:convert';

import 'package:aabkr/env_globals.dart';
import 'package:http/http.dart' as http;

import '../../model/quiz_model.dart';


createTest(String token) async {
  try {
    var quizData = await http.get(
      Uri.parse(
        '$domainName/api/tests/create/1',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var responseBody = jsonDecode(quizData.body);
    int i = 0;
    List<QuizQuestion> temptest = [];
    for (var question in responseBody["data"]["test"]["questions"]) {
      if (i < 10){
      i++;
      QuizQuestion tempQues = QuizQuestion(
        questionId: question["id"].toString(),
        questionText: question["text"],
        answerOneId: question["answers"][0]["id"].toString(),
        answerOneText: question["answers"][0]["text"],
        answerOneIsCorrect: question["answers"][0]["is_correct"].toString(),
        answerTwoId: question["answers"][1]["id"].toString(),
        answerTwoText: question["answers"][1]["text"],
        answerTwoIsCorrect: question["answers"][1]["is_correct"].toString(),
        answerThreeId: question["answers"][2]["id"].toString(),
        answerThreeText: question["answers"][2]["text"],
        answerThreeIsCorrect: question["answers"][2]["is_correct"].toString(),
      );
      temptest.add(tempQues);} else {break;}
    }
    allQuestions = temptest ;
    return allQuestions;
  } catch (e) {
    print('Error :$e');
    return 0;
  }
}


saveTest(List <QuizQuestion> stored ,String token) async {
    List < Map <String,dynamic> > jsonList = stored.map((question) => question.toJson() ).toList();
    Map <String,dynamic> jsonBody = {
      'answers' : jsonList
    };
    var storedData = await http.post(
        Uri.parse(
          '$domainName/api/user-tests/1/answers',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(jsonBody)
    );
    if(storedData.statusCode == 200){
      return 1;
    }else if(storedData.statusCode == 302){
      var redirectedUrl = storedData.headers['location'];
      if (redirectedUrl != null) {
        var redirectResponse = await http.get(
          Uri.parse(redirectedUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        if (redirectResponse.statusCode == 200) {
          var body = jsonDecode(redirectResponse.body);
          percentage = double.parse(body['data']['percentage'].toString());
          return 1;
        } else {
          return 0;
        }
      } else {
    print("error 2");
        return 0;
      }
    }
    else {
    print("error 3");
      return 0;
    }

}
