//Neste exercício vais criar um programa que leia as notas de um aluno,
// calcule a média e determine se foi aprovado.//
import 'dart:io';

void main() {
  // adiciona aqui o teu código
  stdout.write('Nome do aluno: ');
  String nome = stdin.readLineSync()!;

  stdout.write('Nota 1 (0-20): ');
  double nota1 = double.parse(stdin.readLineSync()!);
  stdout.write('Nota 2 (0-20): ');
  double nota2 = double.parse(stdin.readLineSync()!);
  stdout.write('Nota 3 (0-20): ');
  double nota3 = double.parse(stdin.readLineSync()!);

  double media = (nota1 + nota2 + nota3) / 3;
  String mediaFormatada = media.toStringAsFixed(2);

  print('');
  print('=== Aluno: $nome ===');
  print('Nota 1: $nota1  |  Nota 2: $nota2  |  Nota 3: $nota3');
  print('Média: $mediaFormatada');
  print(media >= 10 ? 'Resultado: APROVADO' : 'Resultado: REPROVADO');

}