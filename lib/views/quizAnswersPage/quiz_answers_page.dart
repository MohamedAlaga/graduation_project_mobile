import 'package:aabkr/controllers/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/quizAnswersPage/components/quiz_answers_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../commonComponents/common_smaller_button.dart';
import '../commonComponents/core/utils/styles.dart';
import '../page2/page2_screen.dart';

class QuizAnswersPage extends StatefulWidget {
  const QuizAnswersPage({super.key});

  @override
  _QuizAnswersPageState createState() => _QuizAnswersPageState();
}

class _QuizAnswersPageState extends State<QuizAnswersPage> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = QuizCubit.get(context);
        return Scaffold(
          backgroundColor: mainPageColor,
          appBar: quizAnswersAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount:  cubit.test!.questions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20, bottom: 10),
                            child: Text(
                              cubit.test!.questions[index].text ,
                              maxLines: 3,
                              softWrap: true,
                              style: Styles.style20b600,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                                cubit.test!.questions[index].answers.length, (answerIndex) {
                              return GestureDetector(
                                onTap: () {
                                  if (!cubit.isQuizComplete) {
                                    cubit.handleAnswer(index, answerIndex);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        cubit.test!.questions[index].answers[answerIndex].text,
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
                                          color: cubit.getColorForAnswer(
                                              index, answerIndex),
                                          border:
                                              Border.all(color: Colors.black),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonSmallerButton(buttonColor: mainRed, text: 'السابق'),
                      CommonSmallerButton(
                        buttonColor: mainGreen,
                        text: 'التالي',
                        fun: () {
                          cubit.isQuizComplete = false;
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Page2(),
                              ),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
