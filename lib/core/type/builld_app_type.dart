import 'package:json_annotation/json_annotation.dart';

enum BuildAppType {
  @JsonValue('pplication/vnd.android.package-archive')
  apk,

  @JsonValue('application/x-itunes-ipa')
  ios,
}
