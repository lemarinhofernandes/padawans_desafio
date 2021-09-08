class Todo {
  final int userId;
  final int id;
  final String title;
  final String body;

  Todo(this.userId, this.id, this.title, this.body);

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, body: $body}\n';
  }
}
