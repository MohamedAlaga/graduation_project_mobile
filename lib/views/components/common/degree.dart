import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';

// replace inforation with the right widget
class ConditionalWidget extends StatelessWidget {
  final double? value;

  const ConditionalWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return NullValueWidgets();
    } else if (value! >= 0 && value! < 50) {
      return Fst_widget(
        value: value,
      );
    } else if (value! >= 50 && value! < 70) {
      return send_widget(
        value: value,
      );
    } else if (value! >= 70 && value! < 90) {
      return thrd_widget(
        value: value,
      );
    } else if (value! >= 90 && value! < 100) {
      return four_widget(
        value: value,
      );
    } else if (value! == 100) {
      return five_widget(
        value: value,
      );
    } else {
      return NullValueWidgets();
    }
  }
}

class NullValueWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 325,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'اختبار بسيط😊',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
            width: 50,
            height: 50,
            right: -16,
            top: -16,
            child: Image.asset(
              'assets/pics/Frame 33.png',
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}

class Fst_widget extends ConditionalWidget {
  Fst_widget({required super.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 325,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'نتيجه الاختبار :${value.toString()}🤗',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
              width: 50,
              height: 50,
              right: -16,
              top: -16,
              child: Container(
                alignment: Alignment.topRight,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 210, 0),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 4))
                    ]),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text: '✔',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 32,
                    fcolor: Colors.grey),
              ))
        ],
      ),
    );
  }
}

class send_widget extends ConditionalWidget {
  send_widget({required super.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 56,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'نتيجه الاختبار :${value.toString()}😊 ',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
              width: 50,
              height: 50,
              right: -16,
              top: -16,
              child: Container(
                alignment: Alignment.topRight,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 210, 0),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 4))
                    ]),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text: '✔',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 32,
                    fcolor: Colors.grey),
              ))
        ],
      ),
    );
  }
}

class thrd_widget extends ConditionalWidget {
  const thrd_widget({required super.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 325,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'نتيجه الاختبار :${value.toString()}😃',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
              width: 50,
              height: 50,
              right: -16,
              top: -16,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 210, 0),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 4))
                    ]),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text: '✔',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 32,
                    fcolor: Colors.grey),
              ))
        ],
      ),
    );
  }
}

class four_widget extends ConditionalWidget {
  four_widget({required super.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 325,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'نتيجه الاختبار :${value.toString()}😍',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
              width: 50,
              height: 50,
              right: -16,
              top: -16,
              child: Container(
                alignment: Alignment.topRight,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 210, 0),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 4))
                    ]),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text: '✔',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 32,
                    fcolor: Colors.grey),
              ))
        ],
      ),
    );
  }
}

class five_widget extends ConditionalWidget {
  five_widget({required super.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 325,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          button(
              b_border: 20,
              bHieght: 56,
              bWidth: 328,
              bText: 'نتيجه الاختبار :${value.toString()}😎',
              bcolor: Color.fromARGB(255, 0, 220, 234),
              b_fun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information()),
                );
              },
              bF_Text: 28),
          Positioned(
              width: 50,
              height: 50,
              right: -16,
              top: -16,
              child: Container(
                alignment: Alignment.topRight,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 210, 0),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 4))
                    ]),
                child: C_Text(
                    w_font: FontWeight.w600,
                    text: '✔',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 32,
                    fcolor: Colors.grey),
              ))
        ],
      ),
    );
  }
}
