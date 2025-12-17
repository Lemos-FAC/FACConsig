// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemArquivoStruct extends BaseStruct {
  ItemArquivoStruct({
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

  static ItemArquivoStruct fromMap(Map<String, dynamic> data) =>
      ItemArquivoStruct(
        codigoArquivo: castToType<int>(data['codigoArquivo']),
        nomeArquivo: data['nomeArquivo'] as String?,
        extensaoArquivo: data['extensaoArquivo'] as String?,
        arquivo: data['arquivo'] as String?,
      );

  static ItemArquivoStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemArquivoStruct.fromMap(data.cast<String, dynamic>())
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

  static ItemArquivoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemArquivoStruct(
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
  String toString() => 'ItemArquivoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemArquivoStruct &&
        codigoArquivo == other.codigoArquivo &&
        nomeArquivo == other.nomeArquivo &&
        extensaoArquivo == other.extensaoArquivo &&
        arquivo == other.arquivo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([codigoArquivo, nomeArquivo, extensaoArquivo, arquivo]);
}

ItemArquivoStruct createItemArquivoStruct({
  int? codigoArquivo,
  String? nomeArquivo,
  String? extensaoArquivo,
  String? arquivo,
}) =>
    ItemArquivoStruct(
      codigoArquivo: codigoArquivo,
      nomeArquivo: nomeArquivo,
      extensaoArquivo: extensaoArquivo,
      arquivo: arquivo,
    );
