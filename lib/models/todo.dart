class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.completed, this.title);

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, completed: $completed, title: $title}';
  }
}
