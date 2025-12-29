// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemProvaVidaStruct extends BaseStruct {
  ItemProvaVidaStruct({
    int? codigoArquivo,
    String? nomeArquivo,
    String? extensaoArquivo,
    String? arquivo,
  })  : _codigoArquivo = codigoArquivo,
        _nomeArquivo = nomeArquivo,
        _extensaoArquivo = extensaoArquivo,
        _arquivo = arquivo;

  // "codigoArquivo" field.
  int? _codigoArquivo;
  int get codigoArquivo => _codigoArquivo ?? 0;
  set codigoArquivo(int? val) => _codigoArquivo = val;

  void incrementCodigoArquivo(int amount) =>
      codigoArquivo = codigoArquivo + amount;

  bool hasCodigoArquivo() => _codigoArquivo != null;

  // "nomeArquivo" field.
  String? _nomeArquivo;
  String get nomeArquivo => _nomeArquivo ?? '';
  set nomeArquivo(String? val) => _nomeArquivo = val;

  bool hasNomeArquivo() => _nomeArquivo != null;

  // "extensaoArquivo" field.
  String? _extensaoArquivo;
  String get extensaoArquivo => _extensaoArquivo ?? '';
  set extensaoArquivo(String? val) => _extensaoArquivo = val;

  bool hasExtensaoArquivo() => _extensaoArquivo != null;

  // "arquivo" field.
  String? _arquivo;
  String get arquivo => _arquivo ?? '';
  set arquivo(String? val) => _arquivo = val;

  bool hasArquivo() => _arquivo != null;

  static ItemProvaVidaStruct fromMap(Map<String, dynamic> data) =>
      ItemProvaVidaStruct(
        codigoArquivo: castToType<int>(data['codigoArquivo']),
        nomeArquivo: data['nomeArquivo'] as String?,
        extensaoArquivo: data['extensaoArquivo'] as String?,
        arquivo: data['arquivo'] as String?,
      );

  static ItemProvaVidaStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemProvaVidaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'codigoArquivo': _codigoArquivo,
        'nomeArquivo': _nomeArquivo,
        'extensaoArquivo': _extensaoArquivo,
        'arquivo': _arquivo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'codigoArquivo': serializeParam(
          _codigoArquivo,
          ParamType.int,
        ),
        'nomeArquivo': serializeParam(
          _nomeArquivo,
          ParamType.String,
        ),
        'extensaoArquivo': serializeParam(
          _extensaoArquivo,
          ParamType.String,
        ),
        'arquivo': serializeParam(
          _arquivo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemProvaVidaStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemProvaVidaStruct(
        codigoArquivo: deserializeParam(
          data['codigoArquivo'],
          ParamType.int,
          false,
        ),
        nomeArquivo: deserializeParam(
          data['nomeArquivo'],
          ParamType.String,
          false,
        ),
        extensaoArquivo: deserializeParam(
          data['extensaoArquivo'],
          ParamType.String,
          false,
        ),
        arquivo: deserializeParam(
          data['arquivo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemProvaVidaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemProvaVidaStruct &&
        codigoArquivo == other.codigoArquivo &&
        nomeArquivo == other.nomeArquivo &&
        extensaoArquivo == other.extensaoArquivo &&
        arquivo == other.arquivo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([codigoArquivo, nomeArquivo, extensaoArquivo, arquivo]);
}

ItemProvaVidaStruct createItemProvaVidaStruct({
  int? codigoArquivo,
  String? nomeArquivo,
  String? extensaoArquivo,
  String? arquivo,
}) =>
    ItemProvaVidaStruct(
      codigoArquivo: codigoArquivo,
      nomeArquivo: nomeArquivo,
      extensaoArquivo: extensaoArquivo,
      arquivo: arquivo,
    );
