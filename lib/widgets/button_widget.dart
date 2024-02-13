import 'package:flutter/material.dart';
import 'package:typing_ms/utils/constant_util.dart';

class ButtonWidget extends StatelessWidget {
  // This will be parameter of widget
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback clickHandler;

  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.clickHandler,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constant.buttonColor,
        foregroundColor: Constant.textColor,
        shadowColor: Constant.buttonColor,
        elevation: 10,
        minimumSize: Size(
          buttonWidth,
          buttonHeight,
        ),
        maximumSize: const Size(
          600,
          180,
        ),
      ),
      onPressed: clickHandler,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Constant.textColor,
        ),
      ),
    );
  }
}
