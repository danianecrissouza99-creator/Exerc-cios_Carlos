/*Defina uma função criarPerfilUtilizador que aceita as seguintes parâmetros nomeados :*/
/*- nome (String, obrigatório) - email (String, obrigatório) - idade (int, opcional) 
- país (String, opcional) A função deve retornar um Map<String, dynamic>representando o perfil do utilizador.
 No main(), chame criarPerfilUtilizadorcom diferentes combinações de argumentos e imprima os resultados.*/

void main()
{
  var perfil1 = criarPerfilUtilizador(nome: 'Alice', email: 'alice@example.com');
  var perfil2 = criarPerfilUtilizador(nome: 'Bob', email: 'bob@example.com', idade: 30);
  var perfil3 = criarPerfilUtilizador(nome: 'Charlie', email: 'charlie@example.com', pais: 'Brasil');

  print(perfil1);
  print(perfil2);
  print(perfil3);
}
Map<String, dynamic> criarPerfilUtilizador({
  required String nome,
  required String email,
  int? idade,
  String? pais,
}) {
  return {
    'nome': nome,
    'email': email,
    if (idade != null) 'idade': idade,
    if (pais != null) 'pais': pais,
  };
}

