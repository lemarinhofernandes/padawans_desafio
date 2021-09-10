import 'dart:convert';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:padawans_desafio/models/post.dart';
import 'package:http/http.dart';

import 'interceptors/logging_interceptor.dart';

class PostWebClient {
  Future<List<Post>> findAllPost() async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
    final Response response = await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Post> postagens = [];
    for (Map<String, dynamic> postagemJson in decodedJson) {
      postagens.add(Post.fromJson(postagemJson));
    }
    return postagens;
  }
}
