// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      json['id'] as int,
      json['title'] as String?,
      json['name'] as String?,
      json['original_language'] as String,
      json['original_name'] as String?,
      json['original_title'] as String?,
      json['overview'] as String,
      json['poster_path'] as String,
      json['media_type'] as String?,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['popularity'] as num,
      json['release_date'] as String?,
      json['first_air_date'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num,
      json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'original_language': instance.original_language,
      'original_name': instance.original_name,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'media_type': instance.media_type,
      'genre_ids': instance.genre_ids,
      'popularity': instance.popularity,
      'release_date': instance.release_date,
      'first_air_date': instance.first_air_date,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
