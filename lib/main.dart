import 'package:aabkr/views/page25.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: Page25(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE1ODM4NzkyLCJleHAiOjE3MTU4NDIzOTIsIm5iZiI6MTcxNTgzODc5MiwianRpIjoiR3V2Q1k5QWtraXFhcUpxWSIsInN1YiI6IjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.70rN5Z1_KMIurvYETaEaUOsNuZLZe4B-vJryqySJtUQ", )    );
  }
}
