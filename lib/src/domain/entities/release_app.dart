import '../../../core/type/builld_app_type.dart';

typedef ListAssetReleaseApp = List<AssetReleaseApp>;

typedef ListReleaseApp = List<ReleaseApp>;

class ReleaseApp {
  const ReleaseApp({
    this.url = '',
    required this.id,
    this.nodeId = '',
    this.tagName = '',
    this.name = ' ',
    this.assets = const [],
    this.body = '',
    this.discussionUrl = '',
  });

  final String url;
  final int id;
  final String nodeId;
  final String tagName;
  final String name;
  final List<AssetReleaseApp> assets;
  final String body;
  final String discussionUrl;
}

class AssetReleaseApp {
  const AssetReleaseApp({
    this.url = '',
    required this.id,
    this.nodeId = '',
    this.name = '',
    this.contentType = BuildAppType.apk,
    this.size = 1000,
    this.createdAt,
    this.updatedAt,
    this.browserDownloadUrl = '',
  });

  final String url;
  final int id;
  final String nodeId;
  final String name;
  final BuildAppType contentType;
  final int size;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String browserDownloadUrl;
}
