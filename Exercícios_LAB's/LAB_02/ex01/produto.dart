class Produto {
  String nome;
  double _preco;
  int _stock;

  Produto(this.nome, this._preco, [this._stock = 0]);

  Produto.semStock(this.nome, this._preco) : _stock = 0;

  double get preco   => _preco;
  int    get stock   => _stock;
  bool   get emStock => _stock > 0;

  set preco(double novoPreco) {
    if (novoPreco >= 0) _preco = novoPreco;
  }

  set stock(int novoStock) {
    if (novoStock >= 0) _stock = novoStock;
  }

  @override
  String toString() =>
      'Produto: $nome | Preço: ${_preco.toStringAsFixed(2)}€ | Stock: $_stock';

  void repor(int quantidade) {
    if (quantidade > 0) _stock += quantidade;
  }

  bool vender(int quantidade) {
    if (quantidade <= _stock) {
      _stock -= quantidade;
      return true;
    }
    print('Stock insuficiente.');
    return false;
  }
}




