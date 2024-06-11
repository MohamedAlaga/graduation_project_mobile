import 'core/utils/styles.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({super.key, required this.title,this.align = Alignment.bottomRight,
    this.validator,this.controller});
  final String title ;
  final Alignment align ;
  var validator ;
  var controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: Styles.style24,
      decoration: InputDecoration(
          label: Align(alignment: align,child:Text(title)),
          labelStyle: Styles.style24,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1))),
    );
  }
}

class CommonPasswordField extends StatelessWidget {
  CommonPasswordField({
    Key? key,
    required this.title,
    this.align = Alignment.bottomRight,
    this.validator,
    required this.controller,
  }) : super(key: key);

  final String title;
  final Alignment align;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      obscureText: true,
      style: Styles.style24,
      decoration: InputDecoration(
        label: Align(
          alignment: align,
          child: Text(title),
        ),
        labelStyle: Styles.style24,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}