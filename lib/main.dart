import 'package:aabkr/controllers/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:aabkr/views/page2/page2_screen.dart';
import 'package:aabkr/views/page3/page3_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => QuizCubit()),
      ],
      child: const MyApp(),
    ),
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Page2() );
  }
}
