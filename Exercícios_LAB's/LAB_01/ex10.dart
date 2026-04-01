/*Escrever uma função dividir que aceita dois números e realizar a divisão do primeiro pelo segundo. A função deve:
Lance uma exceção se o divisor for zero .
Lance uma exceção se o valor lido não for possível de usar na operação (ex: tipo inválido).
Não main, ler dois valores do usuário, chamar dividire tratar todas as abordagens com try/catch.*/
import 'dart:io';

double dividir(double a, double b)
{
  if (b==0) throw ArgumentError('Divisão por zero!');
  return a/b; 
}
void main ()
{
  try
  {
  print("Digite o dividendo:");
  double a = double.parse(stdin.readLineSync()!);

  print("Digite o divisor:");
  double b = double.parse(stdin.readLineSync()!);

  double resultado = dividir(a, b);
  print("Resultado: $resultado"); 
  }

  catch (e) {
    print('Erro: $e');
  }
}