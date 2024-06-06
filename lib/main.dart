import 'package:aabkr/controllers/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:aabkr/views/Page10.dart';
import 'package:aabkr/views/Page12.dart';
import 'package:aabkr/views/Page23.dart';
import 'package:aabkr/views/Page32.dart';
import 'package:aabkr/views/Page8.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/page11.dart';
import 'package:aabkr/views/page15.dart';
import 'package:aabkr/views/page2/page2_screen.dart';
import 'package:aabkr/views/page3/page3_screen.dart';
import 'package:aabkr/views/page4.dart';
import 'package:aabkr/views/page5.dart';
import 'package:aabkr/views/page6/page6_screen.dart';
import 'package:aabkr/views/page7/page7_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: 'aabkar',
        theme: ThemeData(
          useMaterial3: true,
        ),debugShowCheckedModeBanner: false,
        home: Page3());
  }
}
