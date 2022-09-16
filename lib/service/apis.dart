import 'package:flutter/foundation.dart';
import 'package:netflix_clone/domain/entities/response_list_data.dart';
import 'package:netflix_clone/service/repository.dart';

class Apis {
  static const String apiKey =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2YxNzdhNTgzMWZhM2QyMWUwMWYzYmY5NTE4OTE0NCIsInN1YiI6IjYzMWMwMzY5Mzk1NDlhMDA4MDE5Nzg1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FjclWDLSsUY5R20LLQNoEvMk2Q3L9ypDlA15_hRhtEk";
}

enum MediaType { All, Movie, Tv, Person }

enum TimeWindow { Day, Week }

enum MovieCategory { Popular, Trending, NowPlaying, TopRated }

extension MyMovieExtension on MovieCategory {
  String get name => describeEnum(this);

  Future<ResponseListData> get task {
    Repository repository = Repository.getInstance();
    String language = "en-US";
    switch (this) {
      case MovieCategory.NowPlaying:
        return repository.getNowPlaying(page: 1, language: language);
      case MovieCategory.Popular:
        return repository.getPopularMovies(page: 1, language: language);
      case MovieCategory.TopRated:
        return repository.getTopRated(page: 1, language: language);
      case MovieCategory.Trending:
        return repository.getTrendingMovies(
            mediaType: MediaType.All, timeWindow: TimeWindow.Day);
    }
  }
}
