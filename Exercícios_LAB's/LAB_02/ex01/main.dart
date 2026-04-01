/*Neste exercício você vai construir passo a passo uma classe Produtocom encapsulamento, construtores e toString().
Passo 1 — Declarar na classe Produtoos seguintes atributos:
Passo 2 — Adicionado o construtor padrão. nomee _precosão obrigatórios; _stocké opcional com valor por omissão de 0:
Passo 3 — Adicionado um construtor nomeado Produto.semStockpara criar um produto sem estoque:
Passo 4 — Adiciona os getters para exportar os atributos privados:
Passo 5 — Adiciona setters que protegem os dados de valores inválidos:
Passo 6 — Sobrepõe toString()para apresentar as informações do produto:
Passo 7 — Implemente os dois métodos em falta:
Não main.dart, deve ter o seguinte cenário:*/
import 'produto.dart';

void main() {
  var p1 = Produto('Teclado', 49.99, 10);
  var p2 = Produto('Rato', 29.99);
  var p3 = Produto.semStock('Monitor', 299.99);

  print(p1.nome);   // Teclado
  print(p2.nome);   // Rato
  print(p3.nome);   // Monitor

  print(p1.preco);    // 49.99
  print(p1.stock);    // 10
  print(p1.emStock);  // true
  print(p2.emStock);  // false

  p1.preco = -10.0;
  print(p1.preco);   // 49.99
  p1.preco = 39.99;
  print(p1.preco);   // 39.99

  print(p1);  // Produto: Teclado | Preço: 39.99€ | Stock: 10
  print(p2);  // Produto: Rato | Preço: 29.99€ | Stock: 0
  print(p3);  // Produto: Monitor | Preço: 299.99€ | Stock: 0

  var p = Produto('Teclado', 49.99, 5);
  print(p);       // Stock: 5
  p.vender(3);
  print(p);       // Stock: 2
  p.vender(4);    // Stock insuficiente.
  print(p);       // Stock: 2
  p.repor(10);
  print(p);       // Stock: 12
}