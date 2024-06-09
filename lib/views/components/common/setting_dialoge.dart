import 'package:aabkr/views/components/common/dialog_text_field.dart';
import 'package:flutter/material.dart';

import 'paragraph_text.dart';

class SettingDialoge extends StatelessWidget {
  SettingDialoge({
    super.key,
    this.outlinecolor = const Color(0xFF00DCEA),
    required this.buttons,
    required this.controler,
  });
  TextEditingController controler;
  final Color outlinecolor;
  final Widget buttons;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 28.0, left: 28.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 4, color: outlinecolor),
                    top: BorderSide(width: 4, color: outlinecolor),
                    right: BorderSide(width: 4, color: outlinecolor),
                    bottom: BorderSide(width: 0, color: outlinecolor)),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: const Center(
                child: ParagrahpText(
                  txt: "ادخل كلمة السر",
                  size: 32,
                  fcolor: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFAED),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 4, color: outlinecolor)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DialogTextField(outlinecolor: outlinecolor, cont: controler),
                  const SizedBox(
                    height: 16,
                  ),
                  buttons
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
