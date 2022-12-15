import 'package:flutter/material.dart';

class Todo {
  int id;
  String content;
  bool isCompleted;

  Todo({
    required this.id,
    required this.content,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'is_completed': isCompleted,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, content: $content, isCompleted: $isCompleted}';
  }
}

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Todo List"),
      ),
      body: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final _formKey = GlobalKey<FormState>();
  final textInputController = TextEditingController();

  late List<Todo> _todos;
  late int _todoSelectedId;

  // lifecycle
  @override
  initState() {
    super.initState();
    _todoSelectedId = 0;

    _todos = [
      // Todo(id: 1, content: "Hello", isCompleted: true),
      // Todo(id: 2, content: "World", isCompleted: false),
    ];
  }

  @override
  void dispose() {
    textInputController.dispose();
    super.dispose();
  }

  // methods
  void _todoCreate(String content) {
    // calculate new todo ID
    int greatestTodoId = 0;

    for (var i = 0; i < _todos.length; i++) {
      var currentTodoId = _todos[i].id;
      if (currentTodoId > greatestTodoId) {
        greatestTodoId = currentTodoId;
      }
    }

    _todos.add(
      Todo(
        id: greatestTodoId + 1,
        content: content,
        isCompleted: false,
      ),
    );

    // show message
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Todo created")));

    // clear the input field
    textInputController.text = "";

    // rebuild widget
    setState(() {});
  }

  void _todoSelect(int id) {
    if (_todoSelectedId != id) {
      Todo todoSelected = _todos.where((todo) => todo.id == id).toList()[0];

      _todoSelectedId = todoSelected.id; // set selected todo ID
      textInputController.text = todoSelected.content; // set input field text
    } else {
      _todoSelectedId = 0; // reset selected todo ID
      textInputController.text = ""; // reset input field text
    }
    setState(() {});
  }

  void _todoToggleIsCompleted(int id) {
    Todo todo = _todos.where((i) => i.id == id).toList()[0];
    todo.isCompleted = !todo.isCompleted;

    setState(() {}); // rebuild widget
  }

  void _todoUpdateContent(int id, String content) {
    Todo todo = _todos.where((i) => i.id == id).toList()[0];
    todo.content = content;

    // show message
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Todo content updated")));

    textInputController.text = ""; // clear text input field
    _todoSelectedId = 0; // reset selected todo

    setState(() {}); // rebuild widget
  }

  void _todoDelete(int id) {
    _todos.retainWhere((todo) => todo.id != id); // remove matching todo

    // show message
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Todo deleted")));

    textInputController.text = ""; // clear text input field
    _todoSelectedId = 0; // reset selected todo

    setState(() {}); // rebuild widget
  }

  // widgets
  Widget _todoForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: textInputController,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText:
                  "${_todoSelectedId == 0 ? 'Add new' : 'Modify'} todo...",
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'This field cannot be empty.';
              }
              return null;
            },
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // todoInsert(widget.db, controller.text).then((todo) {
                  //   widget._todos.add(todo);
                  // });

                  if (_todoSelectedId == 0) {
                    _todoCreate(textInputController.text);
                  } else {
                    _todoUpdateContent(
                        _todoSelectedId, textInputController.text);
                  }
                }
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkmarkIcon(BuildContext context, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.check),
      color: todo.isCompleted ? Colors.green : null,
      tooltip: "Mark complete",
      onPressed: () {
        _todoToggleIsCompleted(todo.id);
      },
    );
  }

  Widget deleteIcon(BuildContext context, Todo todo) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.red,
      tooltip: "Delete this todo",
      onPressed: () {
        _todoDelete(todo.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          _todoForm(context),
          const SizedBox(height: 16.0),
          Expanded(
            child: _todos.isEmpty
                ? const Text("No todos created...")
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _todos.length,
                    itemBuilder: (BuildContext context, int i) {
                      Todo todo = _todos[i];

                      return ListTile(
                        title: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                todo.isCompleted ? Colors.green : Colors.black,
                            alignment: Alignment.centerLeft,
                          ),
                          child: Text(todo.content),
                          onPressed: () {
                            _todoSelect(todo.id);
                          },
                        ),
                        trailing: _todoSelectedId != todo.id
                            ? checkmarkIcon(context, todo)
                            : deleteIcon(context, todo),
                      );
                    },
                  ),
          ),
          Text("$_todoSelectedId"),
        ],
      ),
    );
  }
}
