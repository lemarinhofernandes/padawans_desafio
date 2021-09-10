class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);

  Album.fromJson(Map<String, dynamic> json) :
    userId = json['userId'],
    id = json['id'],
    title = json['title'];


  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}\n';
  }
}
