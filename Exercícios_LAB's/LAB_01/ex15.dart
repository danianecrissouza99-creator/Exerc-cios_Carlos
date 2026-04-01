/*Escreve uma função somaDiagonaisque recebe duas matrizes quadradas (cada uma é uma List<List<int>>) 
e retorna uma lista com a soma dos elementos homólogos das suas diagonais principais.*/

void main()
{
  List<List<int>> matriz1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  List<List<int>> matriz2 = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
  ];

  List<int> resultado = somaDiagonais(matriz1, matriz2);
  print(resultado); // [10, 10, 10]
}
List<int> somaDiagonais(List<List<int>> matriz1, List<List<int>> matriz2)
{
  int n = matriz1.length; // Assumindo que ambas as matrizes são quadradas
  List<int> soma = List.filled(n, 0); // Inicializa a lista de soma com zeros

  for (int i = 0; i < n; i++)
  {
    soma[i] = matriz1[i][i] + matriz2[i][i]; // Soma os elementos das diagonais principais
  }

  return soma;
} 


