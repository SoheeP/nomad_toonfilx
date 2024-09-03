import 'package:flutter/material.dart';

class GrayName extends StatelessWidget {
  final String text;
  const GrayName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return (Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black26,
      ),
    ));
  }
}
