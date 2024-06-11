import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({required this.controller, Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  bool _hasText = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkText);
  }

  void _checkText() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          TextField(
            controller: widget.controller,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscured,
            focusNode: textFieldFocusNode,
            decoration: InputDecoration(
              labelText: 'كلمة المرور',
              labelStyle: TextStyle(
                fontFamily: 'OMNES-ARABIC',
                fontSize: 24,
                color: Color.fromARGB(255, 136, 136, 136),
              ),
              filled: false,
              fillColor: Color.fromARGB(255, 255, 250, 237),
              isDense: true,
              border: UnderlineInputBorder(), // Reduces height a bit
              suffixIcon: _hasText
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 24,
                        ),
                      ),
                    )
                  : null, // Hide icon if text field is empty
            ),
          ),
        ],
      ),
    );
  }
}
