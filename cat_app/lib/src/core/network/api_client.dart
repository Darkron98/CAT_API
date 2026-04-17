import 'package:cat_app/src/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.endpoint,
      headers: {
        'x-api-key': ApiConstants.key,
      },
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {Map<String, dynamic>? body}) async {
    return await dio.post(path, data: body);
  }

  Future<Response> del(String path) async {
    return await dio.delete(path);
  }
}
