import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../env.dart';

typedef GithubRemoteSource = Either<Failure, Response>;

abstract class IGithubApiSource {
  Future<GithubRemoteSource> getReleases();

  Future<GithubRemoteSource> getLatestRelease();
}

@Injectable(as: IGithubApiSource)
class GithubApiSource implements IGithubApiSource {
  const GithubApiSource(this._dio);

  final Dio _dio;

  @override
  Future<GithubRemoteSource> getLatestRelease() async {
    return request('/repos/viviethoang9/irohasu/releases/latest');
  }

  @override
  Future<GithubRemoteSource> getReleases() async {
    return request('/repos/viviethoang9/irohasu/releases');
  }

  Future<GithubRemoteSource> request(String url) async {
    _dio.options.baseUrl = ENV.uriGithub;

    try {
      final response = await _dio.get(url);
      return Right(response);
    } on DioError {
      return Left(ServerFailure());
    }
  }
}
