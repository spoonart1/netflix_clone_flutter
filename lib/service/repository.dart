import 'package:dio/dio.dart';
import 'package:netflix_clone/domain/entities/response_list_data.dart';
import 'package:netflix_clone/service/api_call.dart';
import 'package:netflix_clone/service/apis.dart';
import 'package:netflix_clone/service/interceptor/logging_interceptor.dart';

class Repository {
  static Repository? _repository;
  late ApiCall _client;

  static Repository getInstance() {
    if (_repository == null) {
      _repository = Repository();
      _repository!._makeClient();
    }
    return _repository!;
  }

  void _makeClient() {
    final Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options.headers["Authorization"] = Apis.apiKey;
    dio.interceptors.add(LoggingInterceptor());
    _client = ApiCall(dio);
  }

  Future<ResponseListData> getTrendingMovies(
      {required MediaType mediaType, required TimeWindow timeWindow}) {
    return getInstance()._client.getTrending(
        mediaType.name.toLowerCase(), timeWindow.name.toLowerCase());
  }

  Future<ResponseListData> getPopularMovies(
      {required int page, required String language}) {
    return getInstance()._client.getPopular(page, language);
  }

  Future<ResponseListData> getNowPlaying(
      {required int page, required String language}) {
    return getInstance()._client.getNowPlaying(page, language);
  }

  Future<ResponseListData> getTopRated(
      {required int page, required String language}) {
    return getInstance()._client.getTopRated(page, language);
  }
}
