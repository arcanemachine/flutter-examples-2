import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hello_riverpod/openapi/lib/api.dart';
import 'package:hello_riverpod/state.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Todo List",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: RefreshIndicator(
          onRefresh: ref.read(todosProvider.notifier).todosRefresh,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: const TodoScreen(),
        ),
      ),
    );
  }
}

class TodoScreen extends ConsumerWidget {
  const TodoScreen({Key? key}) : super(key: key);

  Widget _futureTodoList(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(todosProvider.notifier).todosFetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const TodoListView();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Error: Could not retrieve data from the server.",
            ),
          );
        } else {
          return Column(
            children: const <Widget>[
              SizedBox(height: 16.0),
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Center(
                child: Text("Loading data..."),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const TodoForm(),
        const SizedBox(height: 16.0),
        _futureTodoList(context, ref),
      ],
    );
  }
}

class TodoForm extends ConsumerWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final textInputController = TextEditingController();
    final int todoSelectedId = ref.watch(todoSelectedIdProvider);

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
            // text input field
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: textInputController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "${todoSelectedId == 0 ? 'Add' : 'Modify'} todo...",
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
            // submit button
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final String content = textInputController.text;

                  if (todoSelectedId == 0) {
                    // create todo
                    ref
                        .read(todosProvider.notifier)
                        .todoCreate(content)
                        .then((res) {
                      // show message
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Todo created")));
                    }).catchError((err) {
                      // show message
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not create todo")));
                    });
                  } else {
                    // update todo content
                    ref
                        .read(todosProvider.notifier)
                        .todoUpdateContent(todoSelectedId, content)
                        .then((res) {
                      // show message
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Todo content updated")),
                      );

                      // reset selected todo
                      ref.read(todoSelectedIdProvider.notifier).reset();
                    });
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
      color: todo.isCompleted == true ? Colors.green : null,
      tooltip: "Mark complete",
      onPressed: () {
        ref
            .read(todosProvider.notifier)
            .todoToggleIsCompleted(todo.id)
            .then((res) {
          // show message
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Todo status updated")));
        }).catchError((err) {
          // show message
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Could not update todo status")));
        });
      },
    );
  }

  Widget deleteIcon(BuildContext context, WidgetRef ref, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.red,
      tooltip: "Delete todo",
      onPressed: () {
        // delete todo
        ref.read(todosProvider.notifier).todoDelete(todo.id).then((res) {
          // show message
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Todo deleted")));

          // reset selected todo ID
          ref.read(todoSelectedIdProvider.notifier).reset();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider);
    int todoSelectedId = ref.watch(todoSelectedIdProvider);

    // Let's render the todos in a scrollable list view
    return Column(children: <Widget>[
      todos.isEmpty
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
                      foregroundColor: todo.isCompleted == true
                          ? Colors.green
                          : Colors.black,
                      backgroundColor:
                          todo.id == ref.read(todoSelectedIdProvider)
                              ? Colors.blue[100]
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
    ]);
  }
}
