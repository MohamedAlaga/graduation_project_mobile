import 'package:flutter/material.dart';
import '../../controllers/controllers/controllers.dart';
import '../../model/quiz_model.dart';
import '../commonComponents/common_smaller_button.dart';
import '../commonComponents/core/utils/constants.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/core/utils/styles.dart';
import '../quizAnswersPage/quiz_answers_page.dart';
import 'components/quiz_page_app_bar.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> quizQuestions;

  QuizPage({required this.quizQuestions, Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<int?> selectedAnswers;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizQuestions.length, null);
  }

  void handleAnswer(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
    });
  }

  void submitQuiz() async {
    bool allQuestionsAnswered = selectedAnswers.every((answer) => answer != null);
    if (allQuestionsAnswered) {
      for(int i = 0 ; i < widget.quizQuestions.length;i++ ){
        if(selectedAnswers[i] == 0 ){
          widget.quizQuestions[i].userSelectedAnswerId = widget.quizQuestions[i].answerOneId ;
        }
        else if (selectedAnswers[i] == 1){
          widget.quizQuestions[i].userSelectedAnswerId = widget.quizQuestions[i].answerTwoId ;
        }
        else if (selectedAnswers[i] == 2){
          widget.quizQuestions[i].userSelectedAnswerId = widget.quizQuestions[i].answerThreeId ;
        }
        print('question : ${widget.quizQuestions[i].questionText} , answer is :${widget.quizQuestions[i].userSelectedAnswerId } ');
      }
      var y = await saveTest(widget.quizQuestions, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjk6NTAwMC9hcGkvbG9naW4iLCJpYXQiOjE3MTc4NjY1MDksImV4cCI6MTcxNzg3MDEwOSwibmJmIjoxNzE3ODY2NTA5LCJqdGkiOiJ1WHdsWmV2MkpMZDBsOTh6Iiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.lde7QJCKUGfCpGwnr8nBFOEO0Ae17wUQp31qbxQhdJA');
      print(y.toString());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizAnswersPage(
            quizQuestions: widget.quizQuestions,
            selectedAnswers: selectedAnswers,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: mainBlue,
            title: const Center(child: Text('الامتحان غير كامل', style: Styles.style20r)),
            content:  const Text(
              textAlign: TextAlign.right,
              'قم بحل الامتحان كامل قبل الضغط علي انهاء',
              style: Styles.style20w,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('حسنا', style: TextStyle(fontSize: 15, color: Colors.black, fontFamily: 'Omnes Arabic')),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  Color getColorForAnswer(int questionIndex, int answerIndex) {
    return selectedAnswers[questionIndex] == answerIndex ? Colors.amber : mainPageColor;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: quizAppBar(),
      backgroundColor: mainPageColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.quizQuestions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                        child: Text(
                          widget.quizQuestions[index].questionText ?? '',
                          maxLines: 3,
                          softWrap: true,
                          style: Styles.style20b600,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(3, (answerIndex) {
                          String answerText;
                          switch (answerIndex) {
                            case 0:
                              answerText = widget.quizQuestions[index].answerOneText ?? '';
                              break;
                            case 1:
                              answerText = widget.quizQuestions[index].answerTwoText ?? '';
                              break;
                            case 2:
                              answerText = widget.quizQuestions[index].answerThreeText ?? '';
                              break;
                            default:
                              answerText = '';
                          }
                          return GestureDetector(
                            onTap: () {
                              handleAnswer(index, answerIndex);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    answerText,
                                    style: Styles.style20b500,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getColorForAnswer(index, answerIndex),
                                      border: Border.all(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonSmallerButton(buttonColor: mainRed, text: 'الغاء'),
                  CommonSmallerButton(
                    buttonColor: mainBlue,
                    text: 'انهاء',
                    fun: submitQuiz,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
