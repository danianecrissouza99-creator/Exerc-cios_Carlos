//Vai ser semelhante às operações de uma caixa multibanco. 
//O usuário escolhe uma operação a partir de um menu e o programa responde em conformidade,
// usando if/else if/else, switch/casee o operador ternário.//
import 'dart:io';

void main() {
  
  //Variáveis e constantes
  double saldo        = 1250.75;
  const String PIN    = '4321';
  const int MAX_TENT  = 3;
  int tentativas      = 0;
  bool autenticado    = false;

  // Verificação do PIN
  while (tentativas < MAX_TENT && !autenticado) {
    stdout.write('Introduz o PIN: ');
    String pin = stdin.readLineSync()!;
    tentativas++;
    if (pin == PIN) {
      autenticado = true;
    } else {
      int restam = MAX_TENT - tentativas;
      print(restam > 0 ? '  PIN errado. $restam tentativa(s) restante(s).' : '  Cartão bloqueado!');
    }
  }

  if (!autenticado) return;

  print('\nBem-vindo! Saldo actual: €${saldo.toStringAsFixed(2)}');
  print('1 - Consultar saldo');
  print('2 - Levantar dinheiro');
  print('3 - Depositar dinheiro');
  print('4 - Sair');
  stdout.write('Opção: ');
  String opcao = stdin.readLineSync()!;

    switch (opcao) {
    case '1':
      print('\nSaldo actual: €${saldo.toStringAsFixed(2)}');
      break;

    case '2':
      stdout.write('Valor a levantar (€): ');
      double valor = double.parse(stdin.readLineSync()!);
      if (valor <= 0) {
        print('Valor inválido.');
      } else if (valor > saldo) {
        print('Saldo insuficiente! Saldo actual: €${saldo.toStringAsFixed(2)}');
      } else {
        saldo -= valor;
        print('Levantou €${valor.toStringAsFixed(2)}. Novo saldo: €${saldo.toStringAsFixed(2)}');
      }
      break;

    case '3':
      stdout.write('Valor a depositar (€): ');
      double deposito = double.parse(stdin.readLineSync()!);
      if (deposito <= 0) {
        print('Valor inválido.');
      } else {
        saldo += deposito;
        print('Depositou €${deposito.toStringAsFixed(2)}. Novo saldo: €${saldo.toStringAsFixed(2)}');
      }
      break;

    case '4':
      print('Até logo!');
      break;

    default:
      print('Opção inválida.');
  }
}