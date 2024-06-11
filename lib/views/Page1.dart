import 'package:flutter/material.dart';
import 'Page8.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '<',
              style: TextStyle(
                  fontFamily: 'AlaTypoo',
                  fontSize: 150,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Stack(
              children: [
                Text(
                  'عبقر',
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, 4))
                    ],
                    fontSize: 128.0,
                    fontFamily: 'AlaTypoo',
                    fontWeight: FontWeight.w700,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  'عبقر',
                  style: TextStyle(
                    fontSize: 128.0,
                    fontFamily: 'AlaTypoo',
                    fontWeight: FontWeight.w700,

                    color: Color.fromARGB(255, 255, 210, 0), // White fill color
                  ),
                ),
              ],
            ),
            Text(
              '>',
              style: TextStyle(
                  fontFamily: 'AlaTypoo',
                  fontSize: 150,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}
