import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  // Recebe o valor atual do contador como parâmetro obrigatório
  final int counter;

  const SecondScreen({super.key, required this.counter});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // Cópia local do valor recebido
  // as alterações feitas aqui não afetam o ecrã principal até Navigator.pop ser chamado
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  void _increment() => setState(() => _counter++);

  void _decrement() {
    if (_counter > 0) setState(() => _counter--);
  }

  // Fecha o ecrã e devolve o valor atual ao ecrã principal
  void _goBack() => Navigator.pop(context, _counter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2.º Ecrã'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Altera o contador aqui:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'dec',
                  onPressed: _decrement,
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  heroTag: 'inc',
                  onPressed: _increment,
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}