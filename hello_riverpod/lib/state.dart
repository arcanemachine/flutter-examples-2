import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hello_riverpod/openapi/lib/api.dart';
// import 'package:hello_riverpod/types.dart';

final ApiClient apiClient = ApiClient(basePath: "https://tower.test/api");
final TodosApi todosApiClient = TodosApi(apiClient);

class IsLoadingNotifier extends StateNotifier<bool> {
  IsLoadingNotifier() : super(false);
}

final pIsLoading = StateNotifierProvider<IsLoadingNotifier, bool>((ref) {
  return IsLoadingNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  Future todosRefresh() {
    state = [];

    return Future.delayed(const Duration(milliseconds: 500), todosFetch);
  }

  Future todosFetch() {
    Future result =
        todosApiClient.todosList().then((todos) => state = todos as List<Todo>);

    return result;
  }

  Future<void> todoCreate(String content) async {
    try {
      // create API request
      final newTodo = await todosApiClient.todosCreate(Todo(
        id: 0,
        content: content,
        isCompleted: false,
      )) as Todo;

      state = [...state, newTodo];
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> todoDelete(int todoId) async {
    try {
      // create API request
      await todosApiClient.todosDestroy(todoId);

      // update local state
      state = [
        for (final todo in state)
          if (todo.id != todoId) todo,
      ];
    } catch (err) {
      throw Exception(err);
    }

    return true;
  }

  Future<void> todoToggleIsCompleted(int todoId) async {
    // create new todo with updated completion status
    Todo modifiedTodo = state.where((todo) => todo.id == todoId).toList()[0];
    modifiedTodo.isCompleted = !(modifiedTodo.isCompleted as bool);

    // create API request
    Todo updatedTodo =
        await todosApiClient.todosUpdate(modifiedTodo.id, modifiedTodo) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }

  Future<void> todoUpdateContent(int todoId, String content) async {
    // create new todo with updated content
    Todo modifiedTodo = state.where((todo) => todo.id == todoId).toList()[0];
    modifiedTodo.content = content;

    // create API request
    Todo updatedTodo =
        await todosApiClient.todosUpdate(modifiedTodo.id, modifiedTodo) as Todo;

    // update local state
    state = [
      for (final todo in state)
        if (todo.id == todoId) updatedTodo else todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosLocalNotifier extends StateNotifier<List<Todo>> {
  TodosLocalNotifier() : super([]);

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

// final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
//   return TodosNotifier();
// });

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
