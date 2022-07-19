// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_release_app_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetReleaseAppDto _$AssetReleaseAppDtoFromJson(Map<String, dynamic> json) =>
    AssetReleaseAppDto(
      json['url'] as String,
      json['id'] as int,
      json['nodeId'] as String?,
      json['name'] as String,
      $enumDecodeNullable(_$BuildAppTypeEnumMap, json['contentType']) ??
          BuildAppType.apk,
      json['size'] as int,
      json['browser_download_url'] as String?,
    );

Map<String, dynamic> _$AssetReleaseAppDtoToJson(AssetReleaseAppDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'name': instance.name,
      'contentType': _$BuildAppTypeEnumMap[instance.contentType]!,
      'size': instance.size,
      'browser_download_url': instance.browserDownloadUrl,
    };

const _$BuildAppTypeEnumMap = {
  BuildAppType.apk: 'pplication/vnd.android.package-archive',
  BuildAppType.ios: 'application/x-itunes-ipa',
};
