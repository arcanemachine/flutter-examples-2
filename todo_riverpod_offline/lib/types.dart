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
