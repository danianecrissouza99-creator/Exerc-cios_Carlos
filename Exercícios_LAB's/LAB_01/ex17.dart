/*Implemente o jogo Number Guessing Game . O programa deve:

Gere um número aleatório entre 0 e 99 usando Random().nextInt(100)a biblioteca dart:math.
Peça ao usuário que insira um número até acertar, usando um loop do-while.
A cada tentativa, indique se esta foi muito baixa , * muito alta ou correta.
Quando o usuário conseguir, imprimir "You got it!"e terminar.
Conte o número de tentativas e apresente-o no final.*/
import 'dart:math';
import 'dart:io';
void main()
{
  int numeroAleatorio = Random().nextInt(100);
  int tentativas = 0;
  int palpite;

  print("Bem-vindo ao Number Guessing Game!");
  print("Tente adivinhar o número entre 0 e 99.");

  do {
    print("Digite seu palpite:");
    palpite = int.parse(stdin.readLineSync()!);
    tentativas++;

    if (palpite < numeroAleatorio) {
      print("Muito baixo! Tente novamente.");
    } else if (palpite > numeroAleatorio) {
      print("Muito alto! Tente novamente.");
    } else {
      print("You got it! O número era $numeroAleatorio.");
      print("Número de tentativas: $tentativas");
    }
  } while (palpite != numeroAleatorio);
}   
