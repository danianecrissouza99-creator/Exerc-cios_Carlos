/*Escrever uma função contarCaracteresque recebe um Stringcomo argumento e retorna um Map<String,
 int>onde as chaves são os caracteres e os valores são o número de vezes que cada caractere aparece.

Por exemplo, para uma string "banana", a função deve retornar {b: 1, a: 3, n: 2}.*/
void main()
{
  String texto = "banana";
  Map<String, int> resultado = contarCaracteres(texto);
  print(resultado); // {b: 1, a: 3, n: 2}
}
Map<String, int> contarCaracteres(String str)
{
  Map<String, int> contagem = {};
  
  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    if (contagem.containsKey(char)) {
      contagem[char] = contagem[char]! + 1;

    } else {
      contagem[char] = 1;
    }
  }
  
  return contagem;
}