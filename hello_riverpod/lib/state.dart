import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hello_riverpod/openapi/lib/api.dart';
// import 'package:hello_riverpod/types.dart';
import 'package:http/http.dart' as http;

final apiClientProvider = Provider<TodosApi>((ref) {
  final ApiClient apiClient = ApiClient(basePath: "http://127.0.0.1:8000");
  return TodosApi(apiClient);
});

// final apiTodos = FutureProvider<List<Todo>>((ref) async {
//   final apiClient = ref.read(apiClientProvider);
//
//   List<Todo> todos = await apiClient.todosList() ?? [];
//   return todos;
// });

final apiTodos = FutureProvider<List<Todo>>((ref) async {
  final url = Uri.parse("http://localhost:8000/api/todos");

  final Map<String, String> headers = {
    // 'Authorization': "Token ${await secureStorage.read('user_api_token')}",
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  final response = await http.get(url, headers: headers);
  final List decodedResponse = jsonDecode(response.body) as List;

  List<Todo> todoList = [];
  for (int i = 0; i < decodedResponse.length; i++) {
    // add each job to jobList
    Todo todo = Todo.fromJson(decodedResponse[i]) as Todo;
    todoList.add(todo);
  }

  return todoList;
});

final jokeProvider = FutureProvider<Map>((ref) async {
  final url = Uri.parse("https://icanhazdadjoke.com/");

  final Map<String, String> headers = {
    // 'Authorization': "Token ${await secureStorage.read('user_api_token')}",
    'Accept': 'application/json',
  };

  final response = await http.get(url, headers: headers);
  final Map decodedResponse = jsonDecode(response.body);

  // List<Todo> todoList = [];
  // for (int i = 0; i < decodedResponse.length; i++) {
  //   // add each job to jobList
  //   Todo todo = Todo.fromJson(decodedResponse[i]) as Todo;
  //   todoList.add(todo);
  // }

  return decodedResponse;
});

class JokeNotifier extends StateNotifier<Map> {
  JokeNotifier() : super({});

  Map jokeGet() {
    return state;
  }
}

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
