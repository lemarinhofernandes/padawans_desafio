import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:padawans_desafio/models/todo.dart';

import 'interceptors/logging_interceptor.dart';

class TodoWebClient {
  Future<List<Todo>> findAllTodo() async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    final Response response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Todo> todos = [];
    for (Map<String, dynamic> todoJson in decodedJson) {
      todos.add(Todo.fromJson(todoJson));
    }
    return todos;
  }
}
