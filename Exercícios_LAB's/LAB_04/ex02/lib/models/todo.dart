// lib/models/todo.dart
// Modelo de dados — não necessita de alterações

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

/// Lista de tarefas de demonstração
List<Todo> demoTodos() => [
      Todo(id: 1, title: 'Estudar Flutter'),
      Todo(id: 2, title: 'Fazer exercícios do laboratório'),
      Todo(id: 3, title: 'Rever widgets de layout', completed: true),
      Todo(id: 4, title: 'Implementar navegação'),
      Todo(id: 5, title: 'Testar no emulador', completed: true),
    ];