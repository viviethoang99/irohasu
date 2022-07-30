import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../env.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseHttpUrl => ENV.webPage;

  @lazySingleton
  PrettyDioLogger get prettyLogger {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    );
  }

  @lazySingleton
  Dio dio(BaseOptions baseOptions, PrettyDioLogger logger) {
    final interceptors = <Interceptor>[if (kDebugMode) logger];
    return Dio(baseOptions)..interceptors.addAll(interceptors);
  }

  @lazySingleton
  BaseOptions dioBaseOptions(
    @Named('BaseUrl') String url,
  ) {
    return BaseOptions(
      baseUrl: url,
      connectTimeout: 30000,
    );
  }
}
