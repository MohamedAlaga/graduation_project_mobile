import 'package:aabkr/views/components/common/paragraph_text.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({super.key ,required this.title, this.outlinecolor = const Color(0xFF00DCEA)});
  final String title ;
  final Color outlinecolor ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style:  ButtonStyle(shape:MaterialStateProperty.all<RoundedRectangleBorder>( RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0))),
          backgroundColor:  MaterialStatePropertyAll(outlinecolor),
          elevation: const MaterialStatePropertyAll(0),padding: MaterialStateProperty.all(const EdgeInsets.only(left: 25,right: 25,top: 7,bottom: 7)),
          ),
      child: ParagrahpText(
        txt: title,
        fcolor: Colors.white,
        size: 30,
      ),
    );
  }
}
