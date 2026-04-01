import 'formas.dart';

void main() {
  List<Forma> formas = [
    Circulo(5),
    Retangulo(4, 6),
    Triangulo(3, 7),
  ];


  for (var f in formas) {
    f.imprimir();
  }


  double areaTotal = formas.fold(0, (soma, f) => soma + f.area());
  print('Área total: ${areaTotal.toStringAsFixed(2)}');
}