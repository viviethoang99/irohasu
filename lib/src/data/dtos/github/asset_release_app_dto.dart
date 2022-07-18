import 'package:json_annotation/json_annotation.dart';

import '../../../../core/core.dart';
import '../../../domain/entities/entities.dart';

part 'asset_release_app_dto.g.dart';

typedef ListAssetReleaseAppDto = List<AssetReleaseAppDto>;

@JsonSerializable()
class AssetReleaseAppDto {
  const AssetReleaseAppDto(
    this.url,
    this.id,
    this.nodeId,
    this.name,
    this.contentType,
    this.size,
    this.browserDownloadUrl,
  );

  factory AssetReleaseAppDto.fromJson(Map<String, dynamic> json) =>
      _$AssetReleaseAppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AssetReleaseAppDtoToJson(this);

  AssetReleaseApp toModel() {
    return AssetReleaseApp(
      id: id,
      url: url,
      nodeId: nodeId ?? '',
      name: name,
      contentType: contentType,
      size: size,
      browserDownloadUrl: browserDownloadUrl ?? '',
    );
  }

  final String url;
  final int id;
  final String? nodeId;
  final String name;
  @JsonKey(defaultValue: BuildAppType.apk)
  final BuildAppType contentType;
  final int size;
  @JsonKey(name: 'browser_download_url')
  final String? browserDownloadUrl;
}

extension ListAssetReleaseAppDtoX on ListAssetReleaseAppDto {
  ListAssetReleaseApp toListModel() => map((asset) => asset.toModel()).toList();
}
