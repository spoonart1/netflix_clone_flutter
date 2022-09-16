// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseListData _$ResponseListDataFromJson(Map<String, dynamic> json) =>
    ResponseListData(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$ResponseListDataToJson(ResponseListData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
