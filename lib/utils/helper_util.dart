import 'dart:math';

import 'package:faker/faker.dart';

class Helper {
  // This will return word user will type
  static String getWord() {
    Faker fake = Faker();
    final random = Random();
    int flag = random.nextInt(6);
    switch (flag) {
      case 0:
        return fake.randomGenerator.string(
          15,
          min: 2,
        );
      case 1:
        return fake.person.name();
      case 2:
        return fake.animal.name();
      case 3:
        return fake.address.city();
      case 4:
        return fake.sport.name();
      case 5:
        return fake.vehicle.model();
      default:
        return fake.lorem.sentence();
    }
  }

  static String formattedTime(int milliseconds) {
    int hundreds = (milliseconds ~/ 10) % 100;
    int seconds = (milliseconds ~/ 1000) % 60;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int hours = (milliseconds ~/ (1000 * 60 * 60));

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${hundreds.toString().padLeft(2, '0')}';
  }

  static int calculateWPM(String time, int correctWords) {
    List<String> timeParts = time.split(":");
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2]);
    int milliseconds = int.parse(timeParts[3]);

    double totalTimeInSeconds =
        hours * 3600 + minutes * 60 + seconds + milliseconds / 100;

    double wpm = (correctWords / totalTimeInSeconds) * 60;

    return wpm.toInt();
  }

  static int countWords(String input) {
    return input.split(RegExp(r'\s+')).length;
  }
}
