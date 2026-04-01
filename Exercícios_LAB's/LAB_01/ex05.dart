//Implementa o Conversor de Temperatura do livro.//
import 'dart:io';

void main() 
{
  
 String tipo;
  do 
  {

  stdout.write('A temperatura será em  Celsius(A) ou Fahrenheit(B): ');
  tipo = stdin.readLineSync()!.toUpperCase();
  
  switch (tipo) 
    {
      case 'A':
        stdout.write('Temperatura em Celsius: ');
        double celsius = double.parse(stdin.readLineSync()!);
        double fahrenheit = (celsius * 9 / 5) + 32;
        print('\n$celsius °C é igual a ${fahrenheit.toStringAsFixed(2)} °F');
        break;

      case 'B':
        stdout.write('Temperatura em Fahrenheit: ');
        double fahrenheit = double.parse(stdin.readLineSync()!);
        double celsius = (fahrenheit - 32) * 5 / 9;
        print('\n$fahrenheit °F é igual a ${celsius.toStringAsFixed(2)} °C');
        break;

      default:
        print('Opção inválida. Por favor, escolha A ou B.');
      break;
    }
  }while (tipo != 'A' && tipo != 'B');
}
