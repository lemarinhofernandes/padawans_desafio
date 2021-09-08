import 'dart:convert';
import 'package:padawans_desafio/models/album.dart';
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

Future<List<Album>> findAllAlbum() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Album> albuns = [];
  for (Map<String, dynamic> albumJson in decodedJson) {
    final Album album = Album(
      albumJson['userId'],
      albumJson['id'],
      albumJson['title'],
    );
      albuns.add(album);
  }
  return albuns;
}
