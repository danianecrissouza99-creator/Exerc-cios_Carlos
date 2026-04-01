import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});
  // Sem parâmetros pois não é preciso receber nada do ecrã anterior

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // O mesmo provider que o do HomeScreen
    // Qualquer alteração aqui atualiza o HomeScreen em tempo real
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('2.º Ecrã'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        // Botão de retorno simples porque já não há nenhum valor para devolver
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Altera o contador aqui:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(
              '$counter',
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
                  onPressed: () {
                    // Chama o método do Notifier
                    // o estado não é modificado diretamente a partir do widget
                    ref.read(counterProvider.notifier).decrement();
                  },
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  heroTag: 'inc',
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
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