import 'package:flutter/material.dart';
import 'package:typing_ms/screens/summary_screen.dart';
import 'package:typing_ms/utils/constant_util.dart';
import 'package:typing_ms/utils/helper_util.dart';
import 'package:typing_ms/widgets/background_widget.dart';
import 'package:typing_ms/widgets/input_widget.dart';
import 'package:typing_ms/widgets/timer_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // This will be word which user is going to type
  late String mainWord;
  // Stores correct and incorrect count
  late int correctAns, incorrectAns;
  // This wil be color of input box which will be dynamic
  late Color typeBoxColor;
  // TextBox controller
  final TextEditingController _wordController = TextEditingController();

  @override
  void initState() {
    // For Temp let word = "Burger"
    mainWord = Helper.getWord();
    incorrectAns = 0;
    correctAns = 0;
    typeBoxColor = Constant.buttonColor;
    super.initState();
  }

  // Method that will check if word typed is correct or not
  void _checkWord(String typedWord) {
    if (typedWord.length == mainWord.length) {
      setState(() {
        typeBoxColor = Colors.green;
        _wordController.clear();
        mainWord = Helper.getWord();
        correctAns += 1;
      });
    } else {
      // check if word being is correct or not
      if (mainWord.substring(0, typedWord.length) != typedWord) {
        setState(() {
          typeBoxColor = Colors.red;
          _wordController.clear();
          mainWord = Helper.getWord();
          incorrectAns += 1;
        });
      }
      if (mainWord.substring(0, typedWord.length) == typedWord) {
        setState(() {
          typeBoxColor = Constant.buttonColor;
        });
      }
    }
  }

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(
            path: "assets/images/bg2.png",
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: 80,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Upper part of our screen which contains
                  // time count and close button
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Two text one is correct count and another one is incorrect count
                        Column(
                          children: [
                            Text(
                              "Correct - $correctAns",
                              style: const TextStyle(
                                fontSize: 32.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Incorrect - $incorrectAns",
                              style: const TextStyle(
                                fontSize: 31.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Timer Widget
                        const TimerWidget(),
                        // Session Close Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constant.buttonColor,
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {
                            // TODO : Navigate to Summary Screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SummaryScreen(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.close_outlined,
                            size: 48,
                            color: Constant.textColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Ths will display word to write
                  Text(
                    mainWord,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 95.0,
                      color: Constant.backColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Input box widget
                  SizedBox(
                    width: 500,
                    child: InputWidget(
                      inputBoxColor: typeBoxColor,
                      wordController: _wordController,
                      checkWord: _checkWord,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
