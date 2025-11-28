// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoItemStruct extends BaseStruct {
  VideoItemStruct({
    String? url,
    String? nome,
    int? id,
  })  : _url = url,
        _nome = nome,
        _id = id;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static VideoItemStruct fromMap(Map<String, dynamic> data) => VideoItemStruct(
        url: data['url'] as String?,
        nome: data['nome'] as String?,
        id: castToType<int>(data['id']),
      );

  static VideoItemStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'nome': _nome,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static VideoItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoItemStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VideoItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoItemStruct &&
        url == other.url &&
        nome == other.nome &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([url, nome, id]);
}

VideoItemStruct createVideoItemStruct({
  String? url,
  String? nome,
  int? id,
}) =>
    VideoItemStruct(
      url: url,
      nome: nome,
      id: id,
    );
