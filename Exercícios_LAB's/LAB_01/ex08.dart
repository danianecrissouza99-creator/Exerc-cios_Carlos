/*Você vai refatorar uma calculadora simples usando funções com diferentes
 tipos de parâmetros — incluindo parâmetros nomeados e funções guardadas em variáveis.*/


// Arrow functions para operações simples
double somar(double a, double b)       => a + b;
double subtrair(double a, double b)    => a - b;
double multiplicar(double a, double b) => a * b;

// Função com verificação de erro
double dividir(double a, double b) {
  if (b == 0) throw ArgumentError('Divisão por zero!');
  return a / b;
}
double calcular
(
  {
  required double a,
  required double b,
  String operacao = '+',
  }
)
  
{
  switch (operacao) {
    case '+': return somar(a, b);
    case '-': return subtrair(a, b);
    case '*': return multiplicar(a, b);
    case '/': return dividir(a, b);
    default:  throw ArgumentError('Operação inválida: $operacao');
  }
}

void main() {
  // Funções guardadas em variáveis
  double Function(double, double) opSomar = somar;
  var opDividir = dividir;

  print(opSomar(10, 5));    // 15.0
  print(opDividir(10, 4));  // 2.5

  // Chamadas com parâmetros nomeados
  print(calcular(a: 10, b: 5, operacao: '+'));  // 15.0
  print(calcular(a: 10, b: 5));                 // 15.0 (operacao padrão: '+')
  print(calcular(b: 4, a: 20, operacao: '/'));  // 5.0  (ordem não importa)
}
