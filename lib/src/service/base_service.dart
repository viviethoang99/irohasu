import 'package:dio/dio.dart';

import '../../env.dart';

class BaseService {
  final Dio _dio = Dio();

  Future<Response<dynamic>?> request({required String url}) async {
    Response? response;
    _dio.options.baseUrl = ENV.webPage;
    try {
      response = await _dio.get<dynamic>(url);
    } on DioError catch (e) {
      response = e.response;
    }
    return response;
  }
}
