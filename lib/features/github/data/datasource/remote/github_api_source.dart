import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

import '../../../../../env.dart';
import '../../dtos/github/github.dart';

typedef GithubRemoteSource = Either<Failure, Response>;

abstract class IGithubApiSource {
  Future<Either<Failure, List<ReleaseAppDto>>> getReleases();

  Future<Either<Failure, ReleaseAppDto>> getLatestRelease();
}

@Injectable(as: IGithubApiSource)
class GithubApiSource implements IGithubApiSource {
  const GithubApiSource(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, ReleaseAppDto>> getLatestRelease() async {
    try {
      final response = await request('/releases/latest');
      return Right(ReleaseAppDto.fromJson(response.data));
    } on DioError {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ReleaseAppDto>>> getReleases() async {
    try {
      final response = await request('/releases/');
      final listRelease = List<Map<String, dynamic>>.from(response.data);
      return Right(listRelease.map(ReleaseAppDto.fromJson).toList());
    } on DioError {
      return Left(ServerFailure());
    }
  }

  Future<Response> request(String url) async {
    _dio.options.baseUrl = ENV.uriGithub;
    return _dio.get(url);
  }
}
