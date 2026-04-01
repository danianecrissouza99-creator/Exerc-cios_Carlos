import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';
import 'second_screen.dart';

// ConsumerWidget é como um StatelessWidget mas com acesso aos providers.
// O método build recebe um parâmetro extra: WidgetRef ref.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch: subscreve o provider.
    // Quando o valor mudar (mesmo que seja o 2.º ecrã a mudar),
    // este widget é reconstruído automaticamente.
    final counter = ref.watch(counterProvider);

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
              '$counter',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SecondScreen()),
              ),
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