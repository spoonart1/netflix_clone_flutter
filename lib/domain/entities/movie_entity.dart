import 'package:json_annotation/json_annotation.dart';
part 'movie_entity.g.dart';


@JsonSerializable()
class MovieEntity {
  final bool adult;
  final String backdrop_path;
  final int id;
  final String? title;
  final String? name;
  final String original_language;
  final String? original_name;
  final String? original_title;
  final String overview;
  final String poster_path;
  final String? media_type;
  final List<int> genre_ids;
  final num popularity;
  final String? release_date;
  final String? first_air_date;
  final bool? video;
  final num vote_average;
  final int vote_count;

  MovieEntity(
      this.adult,
      this.backdrop_path,
      this.id,
      this.title,
      this.name,
      this.original_language,
      this.original_name,
      this.original_title,
      this.overview,
      this.poster_path,
      this.media_type,
      this.genre_ids,
      this.popularity,
      this.release_date,
      this.first_air_date,
      this.video,
      this.vote_average,
      this.vote_count);

  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);

}
