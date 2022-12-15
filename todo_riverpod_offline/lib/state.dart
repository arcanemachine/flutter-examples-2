import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hello_riverpod/types.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

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
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(content: content) // update todo
        else
          todo // return unchanged todo
    ];
  }

  void todoToggleIsCompleted(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(isCompleted: !todo.isCompleted)
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
