import 'package:dio/dio.dart';
import 'package:netflix_clone/domain/entities/response_list_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api_call.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class ApiCall {
  factory ApiCall(Dio dio, {String baseUrl}) = _ApiCall;

  @GET("/trending/{media_type}/{time_window}")
  Future<ResponseListData> getTrending(@Path("media_type") String mediaType,
      @Path("time_window") String timeWindow);

  @GET("/movie/popular")
  Future<ResponseListData> getPopular(
      @Query("page") int page, @Query("language") String language);

  @GET("/movie/now_playing")
  Future<ResponseListData> getNowPlaying(
      @Query("page") int page, @Query("language") String language);

  @GET("/movie/top_rated")
  Future<ResponseListData> getTopRated(
      @Query("page") int page, @Query("language") String language);
}
