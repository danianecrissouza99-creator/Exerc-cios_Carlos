class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });

  Todo copyWith({
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

List<Todo> exemplo() => [
      Todo(id: 1, title: 'Estudar Flutter', completed: true),
      Todo(id: 2, title: 'Fazer o lab3'),
      Todo(id: 3, title: 'Fazer o lab4'),
      Todo(id: 4, title: 'Testar o emulador'),
    ];