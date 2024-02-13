import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typing_ms/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(
        Brightness.light,
      ),
      home: const HomeScreen(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.mountainsOfChristmasTextTheme(baseTheme.textTheme),
  );
}
