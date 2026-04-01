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
      Todo(id: 1, title: 'Estudar Flutter', completed: true),
      Todo(id: 2, title: 'Fazer o lab3'),
      Todo(id: 3, title: 'Fazer o lab4'),
      Todo(id: 4, title: 'Testar o emulador'),
    ];