import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class FakeDioError extends Fake implements DioException {
  FakeDioError(this._type, [this._response]);

  factory FakeDioError.response([Response? response]) =>
      FakeDioError(DioExceptionType.badResponse, response);

  final DioExceptionType _type;
  final Response? _response;

  @override
  Response? get response => _response;

  @override
  DioExceptionType get type => _type;
}

class FakeResponse<T> extends Fake implements Response<T> {
  FakeResponse({T? data, int? statusCode})
      : _data = data,
        _statusCode = statusCode;

  factory FakeResponse.internalServerError() => FakeResponse(statusCode: 500);

  factory FakeResponse.notFound([T? data]) =>
      FakeResponse(statusCode: 404, data: data);

  factory FakeResponse.success([T? data]) =>
      FakeResponse(statusCode: 200, data: data);

  final T? _data;
  final int? _statusCode;

  @override
  T? get data => _data;

  @override
  int? get statusCode => _statusCode;
}

class MockDio extends Mock implements Dio {}
