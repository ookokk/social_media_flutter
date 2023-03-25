import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;

  const CustomTextButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.textColor = CustomColors.textButtonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, "/signUp"),
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
