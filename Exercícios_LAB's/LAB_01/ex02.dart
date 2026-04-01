//Vai criar um conversor que transforma metros em centímetros, milímetros e polegadas, 
//usando operadores aritméticos e privados de tipo.//
import 'dart:io';

void main() {

  stdout.write('Valor em metros: ');
  double metros = double.parse(stdin.readLineSync()!);
  
  const double CM_POR_METRO = 100;
  const double MM_POR_METRO = 1000;
  const double POLEGADAS_POR_METRO = 39.3701;

  double centimetros = metros * CM_POR_METRO;
  double milimetros  = metros * MM_POR_METRO;
  double polegadas   = metros * POLEGADAS_POR_METRO;

  print('\n$metros metro(s) equivale a:');
  print('  ${centimetros.toStringAsFixed(2)} centímetros');
  print('  ${milimetros.toStringAsFixed(0)} milímetros');
  print('  ${polegadas.toStringAsFixed(4)} polegadas');

  // Divisão inteira
  int vezesInteiras = metros.toInt() ~/ 1;
  print('  Parte inteira: $vezesInteiras m');
}
