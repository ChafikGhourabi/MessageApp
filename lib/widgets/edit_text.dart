import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  EditText({
    required this.hint,
    required this.onChange,
    required this.isPassword,
    // required this.defaultColor,
    // required this.pressedColor,
  });

  final String hint;
  final Function(String) onChange;
  final bool isPassword;
  // final Color defaultColor;
  // final Color pressedColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword,
      textAlign: TextAlign.center,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
