/*Cria uma função filtrar Pares que recebe uma List<int>e retorna uma nova
lista contendo apenas os números pares da lista original.*/

void main()
{
  List <int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List <int> pares = filtrarPares(numeros);
  print("Números pares: $pares");
}

filtrarPares(List<int> numeros) {

  List <int> pares = [];
  for (int i = 0; i <numeros.length; i++)
  {
    if (numeros[i] % 2 == 0)
    {
      pares.add(numeros[i]);
    }
  }
  return pares;
}