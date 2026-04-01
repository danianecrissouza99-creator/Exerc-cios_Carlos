abstract class Forma {
  String nome;

  Forma(this.nome);

  double area();

  void imprimir() {
    print('$nome → Área: ${area().toStringAsFixed(2)}');
  }
}

class Circulo extends Forma {
  double raio;

  Circulo(this.raio) : super('Círculo');

  @override
  double area() => 3.14159 * raio * raio;
}

class Retangulo extends Forma {
  double largura;
  double altura;

  Retangulo(this.largura, this.altura) : super('Retângulo');

  @override
  double area() => largura * altura;
}

class Triangulo extends Forma {
  double base;
  double altura;

  Triangulo(this.base, this.altura) : super('Triângulo');

  @override
  double area() => 0.5 * base * altura;
}