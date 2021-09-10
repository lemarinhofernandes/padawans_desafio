import 'dart:convert';
import 'package:padawans_desafio/http/webclient.dart';
import 'package:padawans_desafio/models/album.dart';
import 'package:http/http.dart';

class AlbumWebClient {
  final WebClientUrl _baseUrl =
      WebClientUrl('https://jsonplaceholder.typicode.com/albums');

  Future<List<Album>> findAllAlbum() async {
    final Response response = await client.get(Uri.parse(_baseUrl.Url));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Album> albuns = [];
    for (Map<String, dynamic> albumJson in decodedJson) {
      albuns.add(Album.fromJson(albumJson));
    }
    return albuns;
  }
}
