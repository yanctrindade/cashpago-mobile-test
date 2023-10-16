import 'package:cashpago_test/resources/colors.dart';
import 'package:flutter/material.dart';

class CPButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color backgroundColor;

  const CPButton(
      {required this.onPressed,
      required this.buttonText,
      Key? key,
      this.backgroundColor = CPColors.primaryGreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(buttonText),
    );
  }
}
