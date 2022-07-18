import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/release_app.dart';
import 'asset_release_app_dto.dart';

part 'release_app_dto.g.dart';

typedef ListReleaseAppDto = List<ReleaseAppDto>;

@JsonSerializable()
class ReleaseAppDto {
  const ReleaseAppDto(
    this.url,
    this.id,
    this.nodeId,
    this.tagName,
    this.name,
    this.assets,
    this.body,
    this.discussionUrl,
  );

  factory ReleaseAppDto.fromJson(Map<String, dynamic> json) =>
      _$ReleaseAppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseAppDtoToJson(this);

  ReleaseApp toEntity() {
    return ReleaseApp(
      url: url,
      id: id,
      nodeId: nodeId ?? '',
      tagName: tagName ?? '',
      name: name,
      assets: assets.toListModel(),
      body: body,
      discussionUrl: discussionUrl ?? '',
    );
  }

  final String url;
  final int id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  @JsonKey(name: 'tag_name')
  final String? tagName;
  final String name;
  final ListAssetReleaseAppDto assets;
  final String body;
  final String? discussionUrl;
}

extension MangaPageDtoListX on ListReleaseAppDto {
  ListReleaseApp toEntities() => map((release) => release.toEntity()).toList();
}
