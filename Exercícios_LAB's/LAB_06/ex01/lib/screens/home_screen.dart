import 'package:flutter/material.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Estado local do ecrã principal
  int _counter = 0;

  Future<void> _goToSecondScreen() async {
    // Navega para o segundo ecrã passando o valor atual como argumento.
    // O await pausa aqui até o utilizador regressar.
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (_) => SecondScreen(counter: _counter),
      ),
    );

    // Quando o utilizador volta, 'result' tem o valor devolvido pelo segundo ecrã.
    // Se for null (botão de retorno do browser/sistema), o valor não é atualizado.
    if (result != null) {
      setState(() => _counter = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecrã Principal'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valor do contador:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _goToSecondScreen,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Ir para o 2.º Ecrã'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}