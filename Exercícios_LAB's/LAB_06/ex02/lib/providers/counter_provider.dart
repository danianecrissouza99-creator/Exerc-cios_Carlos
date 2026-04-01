import 'package:flutter_riverpod/flutter_riverpod.dart';

// CounterNotifier encapsula o estado e toda a lógica de modificação
// O state só pode ser alterado a partir de métodos dentro desta classe e nunca a partir dos widgets
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0; // valor inicial

  void increment() => state++;

  void decrement() {
    if (state > 0) state--;
  }
}

// NotifierProvider expõe o CounterNotifier a toda a app
final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);