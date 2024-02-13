import 'package:flutter/material.dart';
import 'package:typing_ms/utils/constant_util.dart';
import 'package:typing_ms/widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Typing Ms",
                  style: TextStyle(
                    color: Constant.backColor,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ButtonWidget(
                  buttonText: "Lets Type",
                  buttonWidth: 400,
                  buttonHeight: 105,
                  clickHandler: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
