import 'package:flutter/material.dart';
import 'models/todo.dart';

enum TodoFilter { all, active, completed }

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = demoTodos();
  TodoFilter _filter = TodoFilter.all;

  // TODO 1 — Getter _filteredTodos
  //          Filtra _todos conforme _filter
  List<Todo> get _filteredTodos {
    switch (_filter) {
      case TodoFilter.active:
        return _todos.where((todo) => !todo.completed).toList();
      case TodoFilter.completed:
        return _todos.where((todo) => todo.completed).toList();
      case TodoFilter.all:
        return _todos;
    }
  }

  // TODO 2 — Método _addTodo
  //          Abre um AlertDialog com um TextField.
  //          Usa dialogContext no parâmetro do builder e passa-o ao
  //          Navigator.pop — não uses o context do State dentro do diálogo.
  //          Se confirmado e não vazio, adiciona um novo Todo a _todos.
  Future<void> _addTodo() async {
    late String newTitle;
    
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: TextField(
            onChanged: (value) => newTitle = value,
            decoration: const InputDecoration(
              hintText: 'Digite a tarefa...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newTitle.isNotEmpty) {
                  setState(() {
                    _todos.add(Todo(
                      id: _todos.isEmpty ? 1 : _todos.last.id + 1,
                      title: newTitle,
                    ));
                  });
                }
                Navigator.pop(dialogContext);
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  // TODO 3 — Método _toggleCompleted
  //          Inverte todo.completed com setState.
  void _toggleCompleted(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  // TODO 4 — Método _deleteTodo
  //          Remove o todo de _todos com setState.
  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 5 — AppBar com título, e action para remover tarefas concluídas
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            tooltip: 'Remover concluídas',
            onPressed: () {
              setState(() {
                _todos.removeWhere((todo) => todo.completed);
              });
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // TODO 6 — SegmentedButton<TodoFilter> com os três filtros
          //          (Todas / Activas / Concluídas)
          //          Envolve num Padding(horizontal 16, vertical 8)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<TodoFilter>(
              segments: const [
                ButtonSegment(label: Text('Todas'), value: TodoFilter.all),
                ButtonSegment(label: Text('Activas'), value: TodoFilter.active),
                ButtonSegment(label: Text('Concluídas'), value: TodoFilter.completed),
              ],
              selected: {_filter},
              onSelectionChanged: (Set<TodoFilter> newSelection) {
                setState(() {
                  _filter = newSelection.first;
                });
              },
            ),
          ),

          // TODO 7 — Text com o número de tarefas por concluir
          //          Alinhado à esquerda, cinza, fontSize 13
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              '${_todos.where((todo) => !todo.completed).length} tarefas por concluir',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),

          // TODO 8 — Expanded com ListView.builder sobre _filteredTodos.
          //          Cada item é um Dismissible (deslize → direita) que elimina.
          //          O child é um _TodoCard.
          //          Se vazio, mostra mensagem centrada.
          Expanded(
            child: _filteredTodos.isEmpty
                ? const Center(
                    child: Text('Nenhuma tarefa'),
                  )
                : ListView.builder(
                    itemCount: _filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = _filteredTodos[index];
                      return Dismissible(
                        key: ValueKey(todo.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => _deleteTodo(todo),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: _TodoCard(
                          todo: todo,
                          onToggle: () => _toggleCompleted(todo),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // TODO 9 — FAB com Icons.add que chama _addTodo()
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
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
    // TODO 10 — Card com CheckboxListTile.
    //           Título com lineThrough e cor cinza quando concluída.
    //           secondary: ícone que muda conforme o estado.
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
        secondary: Icon(
          todo.completed ? Icons.check_circle : Icons.circle_outlined,
          color: todo.completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}