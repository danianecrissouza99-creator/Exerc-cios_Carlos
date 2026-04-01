/*Crie um programa que apresenta os seguintes resultados usando for, whilee continue:

a) Pede um número ao usuário e imprime a sua tabuada completa (× 1 a × 12) com o formato: 5 × 3 = 15.
b) Imprime todos os números de 1 a 50 que sejam ímpares e divisíveis por 3 — usa continue para 
saltar os que não cumprem os critérios.*/
import 'dart:io';

void main()
{
  //a) Tabuada completa
  stdout.write('Digite um número para ver sua tabuada completa: ');
  int numero = int.parse(stdin.readLineSync()!);

  print('\nTabuada de $numero:');
  for (int i = 1; i <= 12; i++) 
  {
    print('$numero × $i = ${numero * i}');
  }

  //b) Números ímpares e divisíveis por 3
  print('\nNúmeros ímpares de 1 a 50 que são divisíveis por 3:');
  for (int j = 1; j <= 50; j++) 
  {
    if (j % 2 == 0 || j % 3 != 0) 
    {
      continue; // Pula os números pares ou que não são divisíveis por 3
    }
    print(j);
  }

}