import 'package:flutter/material.dart';
import 'todo_screen.dart';

void main() => runApp(const TodoApp()); // ponto de entrada da app

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) { // build descreve o que este widget apresenta no ecrã
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 203, 3, 116)),
      ),
      home: const TodoScreen(), // página inicial da aplicação
    );
  }
}