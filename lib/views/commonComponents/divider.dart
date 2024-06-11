import 'core/utils/constants.dart';
import 'core/utils/styles.dart';
import 'package:flutter/material.dart';
class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Divider(color: Color(0xFF888888)),
      Center(
        child: Container(
            padding: const EdgeInsets.only(left: 10,right:10,bottom: 10,top: 5),
            color: mainPageColor,
            child: const Text('او الدخول باستخدام',style: Styles.style16gray,)),
      )
    ]);
  }
}
