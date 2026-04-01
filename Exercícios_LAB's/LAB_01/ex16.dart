/*Implementa uma função transporMatrizque recebe uma matriz ( List<List<int>>)
e retorna uma nova matriz que é a transposta do original.*/
void main()
{
  List<List<int>> matriz = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  List<List<int>> transposta = transporMatriz(matriz);
  print(transposta); // [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
}
List<List<int>> transporMatriz(List<List<int>> matriz)
{
  int linhas = matriz.length;
  int colunas = matriz[0].length; // Assumindo que todas as linhas têm o mesmo número de colunas

  List<List<int>> transposta = List.generate(colunas, (_) => List.filled(linhas, 0));

  for (int i = 0; i < linhas; i++)
  {
    for (int j = 0; j < colunas; j++)
    {
      transposta[j][i] = matriz[i][j]; // Atribui o elemento transposto
    }
  }

  return transposta;
}
