import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:developer';

class Todo {
  const Todo(
      {required this.id, required this.content, required this.isCompleted});

  final int id;
  final String content;
  final bool isCompleted;

  Todo copyWith({int? id, String? content, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

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

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super(
          [
            const Todo(id: 1, content: "Hello", isCompleted: false),
            const Todo(id: 2, content: "World", isCompleted: false),
          ],
        );

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

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Riverpod"),
        ),
        body: Column(
          children: const <Widget>[
            TodoForm(),
            TodoListView(),
          ],
        ),
      ),
    );
  }
}

class TodoForm extends ConsumerWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final textInputController = TextEditingController();
    final todoSelectedId = ref.read(todoSelectedIdProvider);

    // rebuild widget when selected todo ID changes
    ref.watch(todoSelectedIdProvider);

    // when updating todo, assign input field value to todo content
    if (todoSelectedId != 0) {
      textInputController.text = ref
          .read(todosProvider)
          .where((todo) => todo.id == todoSelectedId)
          .toList()[0]
          .content;
    }

    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: textInputController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Add todo...",
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'This field cannot be empty.';
                }
                return null;
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final String content = textInputController.text;

                  if (todoSelectedId == 0) {
                    // create todo
                    ref.read(todosProvider.notifier).todoCreate(content);

                    // show message
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Todo created")));
                  } else {
                    // update todo content
                    ref
                        .read(todosProvider.notifier)
                        .todoUpdateContent(todoSelectedId, content);

                    // reset selected todo
                    ref.read(todoSelectedIdProvider.notifier).reset();
                  }

                  textInputController.clear(); // clear text input field
                }
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({Key? key}) : super(key: key);

  Widget checkmarkIcon(BuildContext context, WidgetRef ref, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.check),
      color: todo.isCompleted ? Colors.green : null,
      tooltip: "Mark complete",
      onPressed: () {
        ref.read(todosProvider.notifier).todoToggleIsCompleted(todo.id);
      },
    );
  }

  Widget deleteIcon(BuildContext context, WidgetRef ref, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.red,
      tooltip: "Delete todo",
      onPressed: () {
        ref.read(todosProvider.notifier).todoDelete(todo.id); // delete todo

        // reset selected todo ID
        ref.read(todoSelectedIdProvider.notifier).reset();

        // show message
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Todo deleted")));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider);
    int todoSelectedId = ref.watch(todoSelectedIdProvider);

    // Let's render the todos in a scrollable list view
    return Expanded(
      child: todos.isEmpty
          ? const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text("No todos created..."),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int i) {
                Todo todo = todos[i];

                return ListTile(
                  title: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          todo.isCompleted ? Colors.green : Colors.black,
                      backgroundColor:
                          todo.id == ref.read(todoSelectedIdProvider)
                              ? Colors.lightGreenAccent
                              : null,
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(todo.content),
                    onPressed: () {
                      ref.read(todoSelectedIdProvider.notifier).update(todo.id);
                    },
                  ),
                  trailing: todoSelectedId != todo.id
                      ? checkmarkIcon(context, ref, todo)
                      : deleteIcon(context, ref, todo),
                );
              },
            ),
    );
  }
}
