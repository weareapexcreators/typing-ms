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
}
