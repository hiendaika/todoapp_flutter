import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonLabel;
  VoidCallback onPressed;
  MyButton({super.key, required this.buttonLabel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonLabel, style: TextStyle(fontSize: 14)),
    );
  }
}
