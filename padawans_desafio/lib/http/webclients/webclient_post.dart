import 'dart:convert';
import 'package:padawans_desafio/http/webclient.dart';
import 'package:padawans_desafio/models/post.dart';
import 'package:http/http.dart';


class PostWebClient {
  final WebClientUrl _baseUrl = WebClientUrl('https://jsonplaceholder.typicode.com/posts');

  Future<List<Post>> findAllPost() async {
    final Response response = await client.get(Uri.parse(_baseUrl.Url));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Post> postagens = [];
    for (Map<String, dynamic> postagemJson in decodedJson) {
      postagens.add(Post.fromJson(postagemJson));
    }
    return postagens;
  }
}
