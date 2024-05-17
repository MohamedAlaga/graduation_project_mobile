part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}
final class GetTestDataLoadingState extends QuizState {}
final class GetTestDataSuccessState extends QuizState {}
final class GetTestDataErrorState extends QuizState {}
final class HandleAnswerState extends QuizState {}
final class SubmitQuizState extends QuizState {}
final class  GetColorForAnswerState extends QuizState {}
