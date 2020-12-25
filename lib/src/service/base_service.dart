import 'package:dio/dio.dart';

import '../../src/constants/base_blogtruyen.dart';

class BaseService {
  Dio _dio = new Dio();

  Future<dynamic>request({String url})async{
    Response response;
    _dio.interceptors.add(HeaderInterceptor());

    try{
      response = await _dio.get(url);
    }on DioError catch(e){
      response = e.response;
    }
    return response;
  }
}

class HeaderInterceptor extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) {
    options.baseUrl = BlogTruyen.baseUrl;
    return super.onRequest(options);
  }
}