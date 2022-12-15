import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hello_riverpod/openapi/lib/api.dart';
// import 'package:hello_riverpod/types.dart';

Future<List<Todo>> listTodos() async {
  final ApiClient apiClient = ApiClient(basePath: "http://localhost:8000");
  final TodosApi todosApi = TodosApi(apiClient);

  List<Todo> todos = await todosApi.todosList() ?? [];
  return todos;
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void getInitialTodos() async {}

  void todoCreate(String content) {
    List<Todo> todos = state;

    // calculate ID for new todo
    int greatestTodoId = 0;

    for (var i = 0; i < todos.length; i++) {
      int currentTodoId = todos[i].id;
      if (currentTodoId > greatestTodoId) {
        greatestTodoId = currentTodoId;
      }
    }

    final newTodo = Todo(
      id: greatestTodoId + 1,
      content: content,
      isCompleted: false,
    );

    state = [...state, newTodo];
  }

  void todoDelete(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void todoUpdateContent(int todoId, String content) {
    state = [
      for (var todo in state)
        if (todo.id == todoId)
          Todo(id: todo.id, content: content, isCompleted: todo.isCompleted)
        else
          todo, // return unchanged todo
    ];
  }

  void todoToggleIsCompleted(int todoId) {
    final bool isCompleted =
        state.where((todo) => todo.id == todoId).toList()[0].isCompleted ??
            false;

    state = [
      for (final todo in state)
        if (todo.id == todoId)
          Todo(id: todo.id, content: todo.content, isCompleted: !isCompleted)
        else
          todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodoSelectedIdNotifier extends StateNotifier<int> {
  TodoSelectedIdNotifier() : super(0);

  void reset() => state = 0;

  void update(int todoId) {
    if (state != todoId) {
      state = todoId;
    } else {
      state = 0;
    }
  }
}

final todoSelectedIdProvider =
    StateNotifierProvider<TodoSelectedIdNotifier, int>((ref) {
  return TodoSelectedIdNotifier();
});
