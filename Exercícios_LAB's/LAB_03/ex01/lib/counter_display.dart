import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  // A variável que vai receber o número do contador
  final int count;

  // O construtor exigindo que o 'count' seja passado
  const CounterDisplay({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count', // Mostra o número na tela
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}