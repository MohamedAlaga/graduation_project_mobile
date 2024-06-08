import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/quiz_model.dart';


createTest(String token) async {
  try {
    var quizData = await http.get(
      Uri.parse(
        'http://192.168.1.9:5000/api/tests/create/1',
      ),
      headers: <String, String>{
        'User-Agent': 'mobileApp',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'host': "10.2.2.2:8000",
        'Authorization': 'Bearer $token',
      },
    );
    var responseBody = jsonDecode(quizData.body);
    print(responseBody);
    List<QuizQuestion> questions = [];
    for (var question in responseBody["data"]["test"]["questions"]) {
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
      questions.add(tempQues);
    }
    print("question added");
    return questions;
  } catch (e) {
    print('Error :$e');
    return 0;
  }
}


saveTest(List <QuizQuestion> stored ,String token) async {
  try {
    List < Map <String,dynamic> > jsonList = stored.map((question) => question.toJson() ).toList();
    Map <String,dynamic> jsonBody = {
      'answers' : jsonList
    };
    print(jsonBody.toString());
    var storedData = await http.post(
        Uri.parse(
          'http://192.168.1.9:5000/api/user-tests/1/answers',
        ),
        headers: <String, String>{
          'User-Agent': 'mobileApp',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Content-Type': 'application/json',
          'host': "192.168.1.9:5000",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(jsonBody)

    );
    print(jsonDecode(storedData.body)['message']);

    if(storedData.statusCode == 200){
      return 1;
    }
    else {
      print('fali');
      print(storedData.statusCode);
      return 0;
    }

  } catch (e) {
    print('Error :$e');
    return 0;
  }
}
