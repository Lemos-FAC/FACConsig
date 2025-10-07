import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SimulaEmprestimoCall {
  static Future<ApiCallResponse> call({
    String? contratante = '',
    String? tipoSimulacao = '',
    String? quantidadeParcelas = '',
    String? valorEmprestimo = '',
    String? valorParcelas = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contratante": "${escapeStringForJson(contratante)}",
  "tipoSimulacao": "${escapeStringForJson(tipoSimulacao)}",
  "quantidadeParcelas": "${escapeStringForJson(quantidadeParcelas)}",
  "valorEmprestimo": "${escapeStringForJson(valorEmprestimo)}",
  "valorParcelas": "${escapeStringForJson(valorParcelas)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SimulaEmprestimo',
      apiUrl: 'https://api.facsistemas.com.br/simulaEmprestimo',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
