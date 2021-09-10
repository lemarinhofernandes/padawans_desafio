class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.completed, this.title);

  Todo.fromJson(Map<String, dynamic> json) :
    userId = json['userId'],
    id = json['id'],
    title = json['title'],
    completed = json['completed'];


  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, completed: $completed, title: $title}';
  }
}
