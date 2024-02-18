import 'package:flutter/material.dart';
import 'package:typing_ms/screens/home_screen.dart';
import 'package:typing_ms/utils/constant_util.dart';
import 'package:typing_ms/widgets/background_widget.dart';
import 'package:typing_ms/widgets/button_widget.dart';

class SummaryScreen extends StatelessWidget {
  // we will need 4 params
  final int correctAns, incorrectAns;
  final String speed, totalTime;

  const SummaryScreen({
    super.key,
    required this.correctAns,
    required this.incorrectAns,
    required this.speed,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(
            path: "assets/images/bg3.png",
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 30.0,
              bottom: 80.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // This is top must text widget which shows summary of session
                  ButtonWidget(
                    buttonText: "Summary",
                    buttonWidth: 350,
                    buttonHeight: 85,
                    clickHandler: () {},
                  ),
                  // This will be section in which all the results will be shown
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Correct Words                      $correctAns",
                        style: const TextStyle(
                          color: Constant.backColor,
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Incorrect Words                    $incorrectAns",
                        style: const TextStyle(
                          color: Constant.backColor,
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Speed (WPM)                        $speed",
                        style: const TextStyle(
                          color: Constant.backColor,
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Time (HH:MM:SS:MS)                  $totalTime",
                        style: const TextStyle(
                          color: Constant.backColor,
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // This will be button which will close the session
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.buttonColor,
                        shape: const CircleBorder(),
                        elevation: 10,
                      ),
                      onPressed: () {
                        // Here we will navigate to home screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.close_outlined,
                        size: 68,
                        color: Constant.textColor,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
