import 'package:flutter/material.dart';
import 'package:typing_ms/utils/constant_util.dart';

class InputWidget extends StatelessWidget {
  // TextFormField Controller
  final TextEditingController wordController;
  // Color of TextBox
  final Color inputBoxColor;
  // Will be used to check if typed word matches or not to given word
  final void Function(String) checkWord;
  const InputWidget({
    super.key,
    required this.inputBoxColor,
    required this.wordController,
    required this.checkWord,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: wordController,
      onChanged: checkWord,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Constant.textColor,
        fontSize: 32.0,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        // This should be set true only then fillColor
        filled: true,
        fillColor: inputBoxColor,
        hintText: "Type the above text...",
        hintStyle: const TextStyle(
          color: Constant.textColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            35.0,
          ),
        ),
      ),
    );
  }
}
