//Crie um programa que leia a distância percorrida (em km) e
// o tempo de viagem (em horas e minutos separados). O programa deve://
import 'dart:io';

void main() {

  stdout.write('Qual foi a distância percorrida (em km): ');
  double distancia = double.parse(stdin.readLineSync()!);

  stdout.write('Quanto tempo de viagem (as horas): ');
  int horas = int.parse(stdin.readLineSync()!);

  stdout.write('Tempo de viagem (em minutos): ');
  int minutos = int.parse(stdin.readLineSync()!);

  // Converter o tempo para horas
  double tempoEmHoras = horas + minutos / 60;

  // Calcular a velocidade média
  double velocidadeMedia = distancia / tempoEmHoras;
  int mediaredonda = velocidadeMedia.round();

  print('\nVelocidade média: $mediaredonda km/h');
  print('\nVelocidade dentro dos limites: ${velocidadeMedia <= 120 ? 'Sim' : 'Não'}');
}
