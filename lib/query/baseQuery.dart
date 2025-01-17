import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final dio = Dio();

class Respondata<T> {}

class BaseQuery {
  static Future<Map<String, dynamic>> query(BaseQueryPayload payload) async {
    String? baseUrl = dotenv.env["API_CORE_URL"];
    String endpointApi = payload.endpoint.url;
    String url = "$baseUrl/$endpointApi";

    Response<dynamic> response = await dio.request(
      url,
      data: payload.data,
      queryParameters: payload.queryParam,
      options: Options(
        method: payload.endpoint.method.toString(),
        headers: payload.endpoint.header,
      ),
    );

    return response.data as Map<String, dynamic>;
  }
}

class BaseQueryPayload {
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? queryParam;
  EndpointConfig endpoint;

  BaseQueryPayload({
    this.data,
    this.queryParam,
    required this.endpoint,
  });
}

class EndpointConfig {
  final String url;
  final String? method;
  final Map<String, dynamic>? header;

  EndpointConfig({
    required this.url,
    required this.method,
    required this.header,
  });
}
