// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_app_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseAppDto _$ReleaseAppDtoFromJson(Map<String, dynamic> json) =>
    ReleaseAppDto(
      json['url'] as String,
      json['id'] as int,
      json['node_id'] as String?,
      json['tag_name'] as String?,
      json['name'] as String,
      (json['assets'] as List<dynamic>)
          .map((e) => AssetReleaseAppDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['body'] as String,
      json['discussionUrl'] as String?,
    );

Map<String, dynamic> _$ReleaseAppDtoToJson(ReleaseAppDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'node_id': instance.nodeId,
      'tag_name': instance.tagName,
      'name': instance.name,
      'assets': instance.assets,
      'body': instance.body,
      'discussionUrl': instance.discussionUrl,
    };
