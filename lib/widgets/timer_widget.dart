import 'dart:async';

import 'package:flutter/material.dart';
import 'package:typing_ms/utils/constant_util.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  late String _stopwatchText;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch()..start();
    _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTimer);
    _stopwatchText = '00:00:00';
  }

  void _updateTimer(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {
        _stopwatchText = _formattedTime(_stopwatch.elapsedMilliseconds);
      });
    }
  }

  String _formattedTime(int milliseconds) {
    int hundreds = (milliseconds ~/ 10) % 100;
    int seconds = (milliseconds ~/ 1000) % 60;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int hours = (milliseconds ~/ (1000 * 60 * 60));

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${hundreds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _stopwatchText,
          style: const TextStyle(
            fontSize: 64.0,
            color: Constant.backColor,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
