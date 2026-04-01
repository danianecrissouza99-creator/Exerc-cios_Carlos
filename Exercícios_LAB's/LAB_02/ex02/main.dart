import 'veiculo.dart';

void main() {
  var v = Veiculo('Honda', 'CB500', 2021);
  var c = Carro('Toyota', 'Yaris', 2020, 5);
  var t = Camiao('Volvo', 'FH', 2019, 20.0);

  print(v);
  print(c);
  print(t);

  print('---');

  List<Veiculo> frota = [v, c, t];
  for (var veiculo in frota) {
    print(veiculo);
  }
}