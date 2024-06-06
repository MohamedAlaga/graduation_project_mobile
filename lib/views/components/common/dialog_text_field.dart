import 'package:flutter/material.dart';

class DialogTextField extends StatelessWidget {
   DialogTextField({
    super.key,required this.outlinecolor,
    required this.cont
  });
  final Color outlinecolor;
  TextEditingController cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: cont,
      style: const TextStyle(
        height: 0.8,
          fontSize: 28,
          fontFamily: "archivo",
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 221, 221, 221),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: outlinecolor,
                width: 4.0,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(20))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: outlinecolor,
                width: 4.0,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(20)))),
    );
  }
}
