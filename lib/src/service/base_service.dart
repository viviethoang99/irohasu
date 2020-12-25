import 'package:dio/dio.dart';

import '../../src/constants/base_blogtruyen.dart';

class BaseService {
  final Dio _dio = Dio();

  Future<Response<dynamic>> request({String url}) async {
    Response response;
    _dio.interceptors.add(HeaderInterceptor());

    try {
      response = await _dio.get<dynamic>(url);
    } on DioError catch (e) {
      response = e.response;
    }
    return response;
  }
}

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.baseUrl = BlogTruyen.baseUrl;
    return super.onRequest(options);
  }
}
