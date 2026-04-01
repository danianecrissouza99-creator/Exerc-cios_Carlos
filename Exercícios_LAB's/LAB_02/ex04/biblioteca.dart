import 'gestor.dart';
import 'livro.dart';


class Biblioteca implements Gestor {
  final List<Livro> _livros = [];

  @override
  void adicionar(dynamic item) {
    if (item is Livro) _livros.add(item);
  }

  @override
  void listar() {
    for (var livro in _livros) {
      print(livro);
    }
  }

  @override
  int get total => _livros.length;

  void emprestarLivro(String titulo) {
    for (var livro in _livros) {
      if (livro.titulo == titulo) {
        if (livro.disponivel) {
          livro.emprestar();
          print('Emprestado: $titulo');
        } else {
          print('Indisponível: $titulo');
        }
        return;
      }
    }
    print('Não encontrado: $titulo');
  }

  void devolverLivro(String titulo) {
    for (var livro in _livros) {
      if (livro.titulo == titulo) {
        livro.devolver();
        print('Devolvido: $titulo');
        return;
      }
    }
    print('Não encontrado: $titulo');
  }

  void listarDisponiveis() {
    for (var livro in _livros) {
      if (livro.disponivel) print(livro);
    }
  }

  void listarEmprestados() {
    for (var livro in _livros) {
      if (!livro.disponivel) print(livro);
    }
  }
}