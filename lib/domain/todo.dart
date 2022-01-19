class Todo {
  final String description;
  bool done = false;

  Todo(this.description);

  @override
  String toString() {
    return 'Todo{description: $description, done: $done}';
  }
}