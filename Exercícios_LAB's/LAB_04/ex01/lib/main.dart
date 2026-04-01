import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const Lab4Ex1App());
}

class Lab4Ex1App extends StatelessWidget {
  const Lab4Ex1App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Game(),
      debugShowCheckedModeBanner: false,
    );
  }
}