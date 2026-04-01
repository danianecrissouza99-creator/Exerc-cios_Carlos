/*Dado um Set<String>de nomes, escreve uma função adicionarNomeque recebe um nome e tenta adicioná-lo ao conjunto. 
Se o nome já existir no definido,a função deve tratar a situação de forma de envolvimento 
(imprimir uma mensagem adequada e não lançar erro).*/
void main()
{
  Set<String> nomes = {'Alice', 'Bob', 'Charlie'};
  
  adicionarNome(nomes, 'David'); // Adiciona com sucesso
  adicionarNome(nomes, 'Alice'); // Já existe
  print(nomes); // {Alice, Bob, Charlie, David}
}
void adicionarNome(Set<String> nomes, String nome)
{
  if (nomes.contains(nome)) {
    print('O nome "$nome" já existe no conjunto.');
  } else {
    nomes.add(nome);
    print('O nome "$nome" foi adicionado ao conjunto.');
  }
}
