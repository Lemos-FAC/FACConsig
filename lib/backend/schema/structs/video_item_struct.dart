// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoItemStruct extends BaseStruct {
  VideoItemStruct({
    String? url,
  }) : _url = url;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static VideoItemStruct fromMap(Map<String, dynamic> data) => VideoItemStruct(
        url: data['url'] as String?,
      );

  static VideoItemStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoItemStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoItemStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

VideoItemStruct createVideoItemStruct({
  String? url,
}) =>
    VideoItemStruct(
      url: url,
    );
