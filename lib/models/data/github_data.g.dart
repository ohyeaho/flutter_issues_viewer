// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubData _$$_GithubDataFromJson(Map<String, dynamic> json) => _$_GithubData(
      number: json['number'] as int?,
      commentCount: json['comments'] as int?,
      state: json['state'] as String?,
      title: json['title'] as String?,
      description: json['body'] as String?,
      url: json['url'] as String?,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_GithubDataToJson(_$_GithubData instance) => <String, dynamic>{
      'number': instance.number,
      'commentCount': instance.commentCount,
      'state': instance.state,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
