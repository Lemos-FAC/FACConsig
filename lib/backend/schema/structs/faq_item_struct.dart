// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqItemStruct extends BaseStruct {
  FaqItemStruct({
    String? headerValue,
    String? expandedValue,
    int? id,
  })  : _headerValue = headerValue,
        _expandedValue = expandedValue,
        _id = id;

  // "headerValue" field.
  String? _headerValue;
  String get headerValue => _headerValue ?? '';
  set headerValue(String? val) => _headerValue = val;

  bool hasHeaderValue() => _headerValue != null;

  // "expandedValue" field.
  String? _expandedValue;
  String get expandedValue => _expandedValue ?? '';
  set expandedValue(String? val) => _expandedValue = val;

  bool hasExpandedValue() => _expandedValue != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static FaqItemStruct fromMap(Map<String, dynamic> data) => FaqItemStruct(
        headerValue: data['headerValue'] as String?,
        expandedValue: data['expandedValue'] as String?,
        id: castToType<int>(data['id']),
      );

  static FaqItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? FaqItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'headerValue': _headerValue,
        'expandedValue': _expandedValue,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'headerValue': serializeParam(
          _headerValue,
          ParamType.String,
        ),
        'expandedValue': serializeParam(
          _expandedValue,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static FaqItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      FaqItemStruct(
        headerValue: deserializeParam(
          data['headerValue'],
          ParamType.String,
          false,
        ),
        expandedValue: deserializeParam(
          data['expandedValue'],
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
  String toString() => 'FaqItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FaqItemStruct &&
        headerValue == other.headerValue &&
        expandedValue == other.expandedValue &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([headerValue, expandedValue, id]);
}

FaqItemStruct createFaqItemStruct({
  String? headerValue,
  String? expandedValue,
  int? id,
}) =>
    FaqItemStruct(
      headerValue: headerValue,
      expandedValue: expandedValue,
      id: id,
    );
