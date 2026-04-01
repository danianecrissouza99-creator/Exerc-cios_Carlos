class Livro {
  String titulo;
  String autor;
  bool _disponivel = true;

  Livro(this.titulo, this.autor);

  bool get disponivel => _disponivel;

  void emprestar() => _disponivel = false;
  void devolver()  => _disponivel = true;

  @override
  String toString() {
    final estado = _disponivel ? 'Disponível' : 'Emprestado';
    return '$titulo — $autor [$estado]';
  }
}