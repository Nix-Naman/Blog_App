import 'package:dio/dio.dart';

class API {
  Dio _dio = Dio();
  API() {
    _dio.options.baseUrl = "https://intent-kit-16.hasura.app/api/rest";
    _dio.options.headers = {
      'x-hasura-admin-secret':
          '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
    };
  }
  Dio get sendRequest => _dio;
}
