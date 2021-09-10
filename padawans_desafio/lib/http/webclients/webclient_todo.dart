import 'dart:convert';
import 'package:http/http.dart';
import 'package:padawans_desafio/http/webclient.dart';
import 'package:padawans_desafio/models/todo.dart';

class TodoWebClient {
  final WebClientUrl _baseUrl =
      WebClientUrl('https://jsonplaceholder.typicode.com/todos');

  Future<List<Todo>> findAllTodo() async {
    final Response response = await client.get(Uri.parse(_baseUrl.Url));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Todo> todos = [];
    for (Map<String, dynamic> todoJson in decodedJson) {
      todos.add(Todo.fromJson(todoJson));
    }
    return todos;
  }
}
