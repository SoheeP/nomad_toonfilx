import 'package:flutter/material.dart';

class GrayDate extends StatelessWidget {
  final String text;
  const GrayDate({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return (Text(
      text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.3),
      ),
    ));
  }
}
