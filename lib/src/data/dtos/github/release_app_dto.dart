import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/release_app.dart';
import 'asset_release_app_dto.dart';

part 'release_app_dto.g.dart';

@JsonSerializable()
class ReleaseAppDto {
  const ReleaseAppDto(
    this.url,
    this.id,
    this.nodeId,
    this.tagName,
    this.name,
    this.draft,
    this.prerelease,
    this.createdAt,
    this.publishedAt,
    this.assets,
    this.body,
    this.discussionUrl,
  );

  factory ReleaseAppDto.fromJson(Map<String, dynamic> json) =>
      _$ReleaseAppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseAppDtoToJson(this);

  ReleaseApp toEntities() {
    return ReleaseApp(
      url: url,
      id: id,
      nodeId: nodeId,
      tagName: tagName,
      name: name,
      createdAt: createdAt,
      publishedAt: publishedAt,
      assets: assets.toListModel(),
      body: body,
      discussionUrl: discussionUrl,
    );
  }

  final String url;
  final int id;
  final String nodeId;
  final String tagName;
  final String name;
  final bool draft;
  final bool prerelease;
  final DateTime createdAt;
  final DateTime publishedAt;
  final ListAssetReleaseAppDto assets;
  final String body;
  final String discussionUrl;
}
