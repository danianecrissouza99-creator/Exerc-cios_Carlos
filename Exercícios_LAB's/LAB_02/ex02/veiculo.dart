class Veiculo {
  String marca;
  String modelo;
  int ano;

  Veiculo(this.marca, this.modelo, this.ano);

  @override
  String toString() => 'Veiculo: $marca $modelo ($ano)';
}

class Carro extends Veiculo {
  int numPortas;

  Carro(String marca, String modelo, int ano, this.numPortas)
      : super(marca, modelo, ano);

  @override
  String toString() => '${super.toString()} — $numPortas portas';
}

class Camiao extends Veiculo {
  double capacidadeToneladas;

  Camiao(String marca, String modelo, int ano, this.capacidadeToneladas)
      : super(marca, modelo, ano);

  @override
  String toString() => '${super.toString()} — ${capacidadeToneladas}t';
}