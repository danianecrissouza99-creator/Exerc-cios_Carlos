import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

enum TodoFilter { all, active, completed }

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return exemplo();
  }

  void addTodo(String title) {
    final newId = state.isEmpty ? 0 : state.last.id + 1;
    state = [...state, Todo(id: newId, title: title)];
  }

  void toggleCompleted(int id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(completed: !todo.completed)
        else
          todo
    ];
  }

  void deleteTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void clearCompleted() {
    state = state.where((todo) => !todo.completed).toList();
  }
}

final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(() {
  return TodosNotifier();
});

final filterProvider = StateProvider<TodoFilter>((ref) => TodoFilter.all);