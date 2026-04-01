import 'package:flutter/material.dart';
import 'models/todo.dart';

// Enumeração dos três filtros para as tarefas (todas, ativas e concluídas)
enum TodoFilter { all, active, completed }

// TodoScreen é StatefulWidget porque a lista e os filtros podem mudar durante a execução
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState(); // cria o objeto de estado associado a este widget
}

// _TodoScreenState guarda e gere todo o estado deste ecrã
class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = exemplo(); // lista de compras; começa com os dados de exemplo
  TodoFilter _filter = TodoFilter.all;   // filtro default = "Todas"

  // Getter que devolve a lista de compras conforme o filtro selecionado
  List<Todo> get _filteredTodos {
    switch (_filter) {
      case TodoFilter.all:       // devolve a lista completa sem filtrar
        return _todos;
      case TodoFilter.active:    // devolve as compras que ainda não foram concluídas
        return [for (final t in _todos) if (!t.completed) t];
      case TodoFilter.completed: // só devolve as compras que foram concluídas
        return [for (final t in _todos) if (t.completed) t];
    }
  }

  // Controlador do campo de texto
  final _ctrl = TextEditingController();

  // Adiciona uma nova compra à lista se o campo não estiver vazio
  void _addTodo() {
    if (_ctrl.text.trim().isEmpty) return; // ignora se o utilizador não escreveu nada
    
    setState(() => _todos.add(Todo(
          id: (_todos.isEmpty ? 0 : _todos.last.id) + 1, // id = último id da compra + 1
          title: _ctrl.text.trim(),                  // título da compra introduzido pelo utilizador
        )));
    _ctrl.clear(); // limpa o campo após adicionar a compra
  }

  // Alterna o estado da compra entre completada e por completar
  void _toggleCompleted(Todo todo) =>
      setState(() => todo.completed = !todo.completed);

  // Elimina a compra da lista
  void _deleteTodo(Todo todo) =>
      setState(() => _todos.remove(todo));

  @override
  Widget build(BuildContext context) { // chamado pelo Flutter sempre que o estado muda
    return Scaffold( // estrutura base do ecrã
      appBar: AppBar(
        title: const Text('Lista de Compras'), // título da barra superior
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep), // ícone para eliminar tarefas concluídas
            tooltip: 'Eliminar compras concluídas', // este texto aparece ao pressionar o ícone
            onPressed: () =>
                setState(() => _todos.removeWhere((t) => t.completed)), // remove todas as tarefas concluídas
          ),
        ],
      ),
      body: Column( // organiza os filhos verticalmente
        children: [

          // Barra de filtros
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<TodoFilter>( // botão para escolher entre filtros (cada filtro é um segmento)
              segments: const [
                ButtonSegment(
                    value: TodoFilter.all,
                    label: Text('Todas'),
                    icon: Icon(Icons.list)),
                ButtonSegment(
                    value: TodoFilter.active,
                    label: Text('Ativas'),
                    icon: Icon(Icons.radio_button_unchecked)),
                ButtonSegment(
                    value: TodoFilter.completed,
                    label: Text('Concluídas'),
                    icon: Icon(Icons.check_circle_outline)),
              ],
              selected: {_filter}, // segmento ativo
              onSelectionChanged: (s) => setState(() => _filter = s.first), // atualiza o filtro
            ),
          ),

          // Contador de compras pendentes
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              child: Text(
                '${_todos.where((t) => !t.completed).length} compra(s) por fazer',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ),

          // Lista de compras
          Expanded( // ocupa todo o espaço vertical disponível
            child: _filteredTodos.isEmpty
            // condição ternária: se ? (condição verdadeira) : (senão)
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_outline, size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text('Sem compras a fazer', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = _filteredTodos[index];
                      return Dismissible(              // permite remover ao deslizar para o lado
                        key: ValueKey(todo.id),        // chave única obrigatória
                        direction: DismissDirection.startToEnd, // desliza da esquerda para a direita
                        onDismissed: (_) => _deleteTodo(todo),
                        background: Container(         // fundo vermelho visível ao deslizar
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
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

          // Campo para adicionar nova compra
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: const InputDecoration(hintText: 'Nova compra...'),
                    onSubmitted: (_) => _addTodo(), // adiciona a compra à lista
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}     

// _TodoCard é um StatelessWidget que apresenta os dados de uma compra
class _TodoCard extends StatelessWidget {
  final Todo todo; // compra a apresentar — recebida por parâmetro
  final VoidCallback onToggle; // função a ser chamada quando o utilizador clica na checkbox

  const _TodoCard({required this.todo, required this.onToggle}); // construtor com parâmetros posicionais obrigatórios

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // margem à volta do card
      child: CheckboxListTile( // ListTile com checkbox integrada
        value: todo.completed, // estado atual da checkbox
        onChanged: (_) => onToggle(),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null, // risca o texto se a compra estiver concluída
            color: todo.completed ? Colors.grey : null,// cor da compra aparece a cinza se concluída,caso contrário usa a cor normal
          ),
        ),
      ),
    );
  }
}