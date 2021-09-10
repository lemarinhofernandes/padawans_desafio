import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:padawans_desafio/http/interceptors/logging_interceptor.dart';

class WebClientUrl{
  final String Url;
  WebClientUrl(this.Url);
}

final Client client =
InterceptedClient.build(interceptors: [LoggingInterceptor()]);