import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;

  CustomTextButton({required this.onPressed, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.0,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
