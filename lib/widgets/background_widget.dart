import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  // image path
  final String path;
  const BackgroundWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            path,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
