import 'package:flutter/material.dart';

class my_text_filed extends StatelessWidget {
  const my_text_filed({
    required this.h_text,
    required this.controller,
    super.key,
  });
  final String h_text;
  final TextEditingController controller;

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
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 136, 136, 136),
                    fontFamily: 'OMNES-ARABIC',
                  ),
                  labelText: h_text,
                  border: UnderlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ));
  }
}
