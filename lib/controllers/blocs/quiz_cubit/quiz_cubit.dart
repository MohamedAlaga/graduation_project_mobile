import 'dart:convert';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/quiz_model.dart';
import '../../../views/commonComponents/core/utils/constants.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Test ? test;

  getTestDate(String token) async {
    emit(GetTestDataLoadingState());
    var testData = await http.get(
      Uri.parse(
        'http://192.168.1.9:5500/api/tests/create/1',
      ),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Host':"192.168.1.9:5500",
        'User-Agent' :'PostmanRuntime/7.37.3',
        'Accept':'*/*',
        'Accept-Encoding':'gzip, deflate, br',
        'Connection' :'keep-alive',
      },
    );
    if (testData.statusCode == 200) {
      print('Response Body: ${testData.body}');
      emit(GetTestDataSuccessState());
    } else {
      emit(GetTestDataErrorState());
      throw Exception('Failed to load data: ${testData.statusCode}');
    }
  }


  void handleAnswer(int questionIndex, int answerIndex) {
   test!.questions[questionIndex].answers[answerIndex].isCorrect =!
   test!.questions[questionIndex].answers[answerIndex].isCorrect;
    emit(HandleAnswerState());
  }

  bool isQuizComplete = false;

  void submitQuiz() {
    isQuizComplete = true;
    emit(SubmitQuizState());
  }

  Color getColorForAnswer(int questionIndex, int answerIndex) {
    if (!isQuizComplete) {
      return test!.questions[questionIndex].answers[answerIndex].isCorrect
          ? Colors.amber
          : mainPageColor;
    } else {
      if (test!.questions[questionIndex].answers[answerIndex].isCorrect) {
        return mainGreen;
      } else {
        return mainRed;
      }
    }
  }

}
