import 'package:flutter/material.dart';

class my_text_filed extends StatelessWidget {
  const my_text_filed({
    required this.h_text,
    required this.controller,
    this.validator,
    super.key,
  });
  
  final String h_text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 136, 136, 136),
                  fontFamily: 'OMNES-ARABIC',
                ),
                labelText: h_text,
                border: const UnderlineInputBorder(),
                alignLabelWithHint: true,
              ),
              textDirection: TextDirection.rtl,
              validator: validator,
            ),
          ],
        ),
      ),
    );
  }
}