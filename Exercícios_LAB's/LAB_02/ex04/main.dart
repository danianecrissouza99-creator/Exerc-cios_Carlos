import 'livro.dart';
import 'biblioteca.dart';

void main() {
  var biblioteca = Biblioteca();

  biblioteca.adicionar(Livro('Dom Quixote', 'Cervantes'));
  biblioteca.adicionar(Livro('1984', 'George Orwell'));
  biblioteca.adicionar(Livro('Dune', 'Frank Herbert'));
  biblioteca.adicionar(Livro('Os Lusiadas', 'Luiz Vaz de Camoes'));

  print('--- Todos os livros ---');
  biblioteca.listar();
  print('');
  biblioteca.emprestarLivro('Dom Quixote');
  biblioteca.emprestarLivro('1984');
  biblioteca.emprestarLivro('Dom Quixote');
  print('');
  biblioteca.devolverLivro('1984');
  print('\n--- Disponíveis ---');
  biblioteca.listarDisponiveis();
  print('\n--- Emprestados ---');
  biblioteca.listarEmprestados();
  print('\nTotal de livros: ${biblioteca.total}');
}