import 'package:json_annotation/json_annotation.dart';

part 'response_list_data.g.dart';

@JsonSerializable()
class ResponseListData {
  final int page;
  final List<Map<String, dynamic>> results;
  final int total_pages;
  final int total_results;

  ResponseListData(this.page, this.results, this.total_pages, this.total_results);
  factory ResponseListData.fromJson(Map<String, dynamic> json) => _$ResponseListDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseListDataToJson(this);

}
