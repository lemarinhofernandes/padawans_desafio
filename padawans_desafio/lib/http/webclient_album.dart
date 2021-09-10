import 'dart:convert';
import 'package:padawans_desafio/models/album.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'interceptors/logging_interceptor.dart';

class AlbumWebClient {
  Future<List<Album>> findAllAlbum() async {
    final Client client =
        InterceptedClient.build(interceptors: [LoggingInterceptor()]);
    final Response response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Album> albuns = [];
    for (Map<String, dynamic> albumJson in decodedJson) {
      albuns.add(Album.fromJson(albumJson));
    }
    return albuns;
  }
}
