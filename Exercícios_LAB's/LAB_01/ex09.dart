/*Crie um programa ( ex9_matematica.dart) que implemente as seguintes funções. Importe dart:mathno início do arquivo.
a) Uma função hipotenusa(double a, double b)que calcula a hipotenusa de um triângulo retângulo usando sqrt(pow(a, 2) + pow(b, 2)).
b) Uma função areaCirculo(double raio)que devolve a área usando pi * pow(raio, 2)(usa uma constante pido dart:math).
c) Uma função anônima guardada numa variável que gera um número aleatório entre dois limites:var aleatorio = (int min, int max) => ...
d) Não main(), testa as três funções com valores lidos do usuário.*/
import 'dart:math';
import 'dart:io';

double hipotenusa(double a, double b)
{
  return sqrt(pow(a, 2) + pow(b, 2));
}

double areaCirculo(double raio)
{
  return pi * pow(raio, 2);
}
var aleatorio = (int min, int max) => Random().nextInt(max - min + 1) + min;

void main()
{
  print("Digite o valor do cateto a:");
  double a = double.parse(stdin.readLineSync()!);

  print("Digite o valor do cateto b:");
  double b = double.parse(stdin.readLineSync()!);

  print("A hipotenusa é: ${hipotenusa(a, b)}");

  print("Digite o valor do raio do círculo:");
  double raio = double.parse(stdin.readLineSync()!);

  print("A área do círculo é: ${areaCirculo(raio)}");

  print("Digite o valor mínimo para o número aleatório:");
  int min = int.parse(stdin.readLineSync()!);

  print("Digite o valor máximo para o número aleatório:");
  int max = int.parse(stdin.readLineSync()!);
  
  print("Número aleatório entre $min e $max: ${aleatorio(min, max)}");
}


