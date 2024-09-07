import 'package:flutter/material.dart';
import 'package:nomad_toonfilx/widgets/cartoon/screens/home_screen.dart';

class CartoonMain extends StatelessWidget {
  const CartoonMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(child: HomeScreen()),
    );
  }
}
