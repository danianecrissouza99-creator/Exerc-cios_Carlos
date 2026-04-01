/*Crie um programa ( ex6_pin.dart) que simule um sistema de autenticação por PIN. 
O usuário tem 3 tentativas para inserir o PIN correto. EUA whilee break.*/
import 'dart:io';

void main()
{
  const String pinCorreto = '1234';
  int tentativas = 0;
  String pinInserido;

  while (tentativas < 3) 
  {
    stdout.write('Digite o PIN: ');
    pinInserido = stdin.readLineSync()!;

    if (pinInserido == pinCorreto) 
    {
      print('Acesso concedido!');
      print('Bem-vindo ao sistema!');
      break;

    } else 
    {
      tentativas++;
      print('PIN incorreto. Tentativa $tentativas de 3.');
      if (tentativas == 3)
      {
      print('Acesso negado. Você excedeu o número de tentativas.');
      }
    }
  } 
}