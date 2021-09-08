import 'dart:convert';
import 'package:padawans_desafio/models/post.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

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

Future<List<Todo>> findAllPost() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Todo> postagens = [];
  for (Map<String, dynamic> postagemJson in decodedJson) {
    final Todo postagem = Todo(postagemJson['userId'], postagemJson['id'],
        postagemJson['title'], postagemJson['body']);
    postagens.add(postagem);
  }
  return postagens;
}
