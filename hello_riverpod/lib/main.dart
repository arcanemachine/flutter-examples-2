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
    final int todoSelectedId = ref.read(todoSelectedIdProvider);

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
      color: todo.isCompleted == true ? Colors.green : null,
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
    AsyncValue<Map> joke = ref.watch(jokeProvider);

    return joke.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text("Error: $err"),
      data: (data) => Text(data['joke']),
    );
  }

  // Widget build(BuildContext context, WidgetRef ref) {
  //   // rebuild the widget when the todo list changes
  //   AsyncValue<List<Todo>> todos = ref.read(apiTodos);
  //   int todoSelectedId = ref.watch(todoSelectedIdProvider);

  //   // Let's render the todos in a scrollable list view
  //   return todos.when(
  //       loading: () => const CircularProgressIndicator(),
  //       error: (err, stack) => Text("Error: $err"),
  //       data: (todos) {
  //         return Expanded(
  //           child: todos.isEmpty
  //               ? const Padding(
  //                   padding: EdgeInsets.only(top: 16.0),
  //                   child: Text("No todos created..."),
  //                 )
  //               : ListView.builder(
  //                   shrinkWrap: true,
  //                   scrollDirection: Axis.vertical,
  //                   physics: const AlwaysScrollableScrollPhysics(),
  //                   itemCount: todos.length,
  //                   itemBuilder: (BuildContext context, int i) {
  //                     Todo todo = todos[i];

  //                     return ListTile(
  //                       title: TextButton(
  //                         style: TextButton.styleFrom(
  //                           foregroundColor: todo.isCompleted == true
  //                               ? Colors.green
  //                               : Colors.black,
  //                           backgroundColor:
  //                               todo.id == ref.read(todoSelectedIdProvider)
  //                                   ? Colors.blue[100]
  //                                   : null,
  //                           alignment: Alignment.centerLeft,
  //                         ),
  //                         child: Text(todo.content),
  //                         onPressed: () {
  //                           ref
  //                               .read(todoSelectedIdProvider.notifier)
  //                               .update(todo.id);
  //                         },
  //                       ),
  //                       trailing: todoSelectedId != todo.id
  //                           ? checkmarkIcon(context, ref, todo)
  //                           : deleteIcon(context, ref, todo),
  //                     );
  //                   },
  //                 ),
  //         );
  //       });
  // }
}
