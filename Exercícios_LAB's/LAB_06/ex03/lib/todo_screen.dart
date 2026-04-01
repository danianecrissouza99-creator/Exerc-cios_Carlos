import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/todo.dart';

enum TodoFilter { all, active, completed }

// ==========================================
// PROVIDERS
// ==========================================

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

// ==========================================
// UI
// ==========================================

class TodoScreen extends ConsumerWidget {
  TodoScreen({super.key});

  final _ctrl = TextEditingController();

  void _addTodo(WidgetRef ref) {
    if (_ctrl.text.trim().isEmpty) return;
    
    ref.read(todosProvider.notifier).addTodo(_ctrl.text.trim());
    _ctrl.clear(); 
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    final filter = ref.watch(filterProvider);

    List<Todo> filteredTodos;
    switch (filter) {
      case TodoFilter.all:
        filteredTodos = todos;
        break;
      case TodoFilter.active:
        filteredTodos = todos.where((t) => !t.completed).toList();
        break;
      case TodoFilter.completed:
        filteredTodos = todos.where((t) => t.completed).toList();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Eliminar tarefas concluídas',
            onPressed: () => ref.read(todosProvider.notifier).clearCompleted(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<TodoFilter>(
              segments: const [
                ButtonSegment(value: TodoFilter.all, label: Text('Todas'), icon: Icon(Icons.list)),
                ButtonSegment(value: TodoFilter.active, label: Text('Ativas'), icon: Icon(Icons.radio_button_unchecked)),
                ButtonSegment(value: TodoFilter.completed, label: Text('Concluídas'), icon: Icon(Icons.check_circle_outline)),
              ],
              selected: {filter}, 
              onSelectionChanged: (s) => ref.read(filterProvider.notifier).state = s.first, 
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              child: Text(
                '${todos.where((t) => !t.completed).length} tarefa(s) por concluir',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ),

          Expanded(
            child: filteredTodos.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_outline, size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text('Sem tarefas a apresentar', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = filteredTodos[index];
                      return Dismissible(
                        key: ValueKey(todo.id),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (_) => ref.read(todosProvider.notifier).deleteTodo(todo.id),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: _TodoCard(
                          todo: todo,
                          onToggle: () => ref.read(todosProvider.notifier).toggleCompleted(todo.id),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: const InputDecoration(hintText: 'Nova tarefa...'),
                    onSubmitted: (_) => _addTodo(ref), 
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTodo(ref),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;

  const _TodoCard({required this.todo, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: CheckboxListTile(
        value: todo.completed,
        onChanged: (_) => onToggle(),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
            color: todo.completed ? Colors.grey : null,
          ),
        ),
      ),
    );
  }
}