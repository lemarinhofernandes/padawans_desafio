import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:padawans_desafio/models/todo.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // print('Request');
    // print('url: ${data.baseUrl}');
    // print('headers: ${data.headers}');
    // print('body: ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // print('Response');
    // print('status code: ${data.statusCode}');
    // print('headers: ${data.headers}');
    // print('body: ${data.body}');
    return data;
  }
}

Future<List<Todo>> findAllTodo() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Todo> todos = [];
  for (Map<String, dynamic> todoJson in decodedJson) {
    final Todo todo = Todo(
      todoJson['userId'],
      todoJson['id'],
      todoJson['completed'],
      todoJson['title'],
    );
    todos.add(todo);
  }
  return todos;
}
