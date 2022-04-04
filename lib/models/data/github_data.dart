import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_data.freezed.dart';
part 'github_data.g.dart';

@freezed
abstract class GithubData with _$GithubData {
  const factory GithubData({
    int number,
    int commentCount,
    String state,
    String title,
    String? description,
    String url,
    DateTime createdAt,
    DateTime updatedAt,
  }) = _GithubData;

  factory GithubData.fromJson(Map<String, dynamic> json) => _$GithubDataFromJson(json);
}
