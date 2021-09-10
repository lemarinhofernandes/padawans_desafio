import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:padawans_desafio/http/interceptors/logging_interceptor.dart';


final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';