import 'package:flutter/material.dart';

void main() {
  runApp(const Ex02App());
}

class Ex02App extends StatelessWidget {
  const Ex02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          '$_contador',
          style: const TextStyle(fontSize: 80),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementar,
        child: const Icon(Icons.add),
      ),
    );
  }
}