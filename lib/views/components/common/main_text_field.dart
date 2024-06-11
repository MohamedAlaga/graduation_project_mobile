import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {super.key,
      required this.title,
      this.align = Alignment.centerRight,this.isPass=false,
      required this.txtcontroller,
      this.text = ""});
  final TextEditingController txtcontroller;
  final String title;
  final Alignment align;
  final bool isPass;
  final String text;
  @override
  Widget build(BuildContext context) {
    txtcontroller.text = text;
    return TextFormField(
      controller: txtcontroller,
      obscureText: isPass,
      cursorColor: Colors.black,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        fontFamily: "OMNES-ARABIC",
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
          label: Align(
              alignment: align,
              child: ParagrahpText(
                txt: title,
                size: 24,
                fcolor: Colors.grey,
              )),
          labelStyle: const TextStyle(color: Color(0xff888888), height: 0.7),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 4)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2))),
    );
  }
}
