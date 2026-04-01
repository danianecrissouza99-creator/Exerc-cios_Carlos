class Todo {
  final int id;
  final String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });
}

// Lista de tarefas de exemplo
List<Todo> exemplo() => [
      Todo(id: 1, title: 'Comprar pão', completed: true),
      Todo(id: 2, title: 'Comprar leite'),
      Todo(id: 3, title: 'Comprar queijo'),
      Todo(id: 4, title: 'Comprar frutas'),
    ];