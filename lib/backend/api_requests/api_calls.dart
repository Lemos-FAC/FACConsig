import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FACConsig Group Code

class FACConsigGroup {
  static String getBaseUrl() => 'https://api.facsistemas.com.br/';
  static Map<String, String> headers = {
    'Authorization':
        'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
  };
  static SimulaEmprestimoConsigCall simulaEmprestimoConsigCall =
      SimulaEmprestimoConsigCall();
  static DadosContratanteConsigCall dadosContratanteConsigCall =
      DadosContratanteConsigCall();
  static AutenticacaoConsigCall autenticacaoConsigCall =
      AutenticacaoConsigCall();
  static CadastraSenhaCall cadastraSenhaCall = CadastraSenhaCall();
  static AtualizaDadosCall atualizaDadosCall = AtualizaDadosCall();
  static ExcluirContaCall excluirContaCall = ExcluirContaCall();
  static RecuperarSenhaCall recuperarSenhaCall = RecuperarSenhaCall();
  static BuscaBancosCall buscaBancosCall = BuscaBancosCall();
  static ContratosCall contratosCall = ContratosCall();
  static PropostasCall propostasCall = PropostasCall();
  static DocumentosPendentesCall documentosPendentesCall =
      DocumentosPendentesCall();
  static EnviaDocumentoCall enviaDocumentoCall = EnviaDocumentoCall();
}

class SimulaEmprestimoConsigCall {
  Future<ApiCallResponse> call({
    String? contratante = '',
    String? tipoSimulacao = '',
    String? quantidadeParcelas = '',
    String? valorEmprestimo = '',
    String? valorParcelas = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "contratante": "${escapeStringForJson(contratante)}",
  "tipoSimulacao": "${escapeStringForJson(tipoSimulacao)}",
  "quantidadeParcelas": "${escapeStringForJson(quantidadeParcelas)}",
  "valorEmprestimo": "${escapeStringForJson(valorEmprestimo)}",
  "valorParcelas": "${escapeStringForJson(valorParcelas)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'simulaEmprestimoConsig',
      apiUrl: '${baseUrl}simulaEmprestimo',
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

class DadosContratanteConsigCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'dadosContratanteConsig',
      apiUrl: '${baseUrl}dadosContratante',
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

class AutenticacaoConsigCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? dataNascimento = '',
    String? senha = '',
    String? primeiroAcesso = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}",
  "senha": "${escapeStringForJson(senha)}",
  "dataNascimento": "${escapeStringForJson(dataNascimento)}",
  "primeiroAcesso": "${escapeStringForJson(primeiroAcesso)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'autenticacaoConsig',
      apiUrl: '${baseUrl}autenticaUsuario',
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

class CadastraSenhaCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}",
  "senha": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cadastraSenha',
      apiUrl: '${baseUrl}cadastraSenha',
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

class AtualizaDadosCall {
  Future<ApiCallResponse> call({
    String? cep = '',
    String? endereco = '',
    String? bairro = '',
    String? uf = '',
    String? cidade = '',
    String? telefone = '',
    String? email = '',
    String? banco = '',
    String? agencia = '',
    String? conta = '',
    String? tipoConta = '',
    String? dataNascimento = '',
    int? cpf,
    int? matricula,
    dynamic camposJson,
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final campos = _serializeJson(camposJson, true);
    final ffApiRequestBody = '''
{
  "cpf": ${cpf},
  "matricula": ${matricula},
  "campos": {
    "cep": "${escapeStringForJson(cep)}",
    "endereco": "${escapeStringForJson(endereco)}",
    "bairro": "${escapeStringForJson(bairro)}",
    "uf": "${escapeStringForJson(uf)}",
    "cidade": "${escapeStringForJson(cidade)}",
    "telefone": "${escapeStringForJson(telefone)}",
    "email": "${escapeStringForJson(email)}",
    "banco": "${escapeStringForJson(banco)}",
    "agencia": "${escapeStringForJson(agencia)}",
    "conta": "${escapeStringForJson(conta)}",
    "tipoConta": "${escapeStringForJson(tipoConta)}",
    "dataNascimneto": "${escapeStringForJson(dataNascimento)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'atualizaDados',
      apiUrl: '${baseUrl}atualizaContratante',
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

class ExcluirContaCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'excluirConta',
      apiUrl: '${baseUrl}excluirConta/${cpf}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RecuperarSenhaCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'recuperarSenha',
      apiUrl: '${baseUrl}recuperarSenha/${cpf}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscaBancosCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'buscaBancos',
      apiUrl: '${baseUrl}buscaBancos',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ContratosCall {
  Future<ApiCallResponse> call({
    int? cpf,
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": ${cpf}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'contratos',
      apiUrl: '${baseUrl}contratos',
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

class PropostasCall {
  Future<ApiCallResponse> call({
    int? cpf,
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": ${cpf}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'propostas',
      apiUrl: '${baseUrl}propostas',
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

class DocumentosPendentesCall {
  Future<ApiCallResponse> call({
    String? cpf = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'documentosPendentes',
      apiUrl: '${baseUrl}documentosPendentes',
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

class EnviaDocumentoCall {
  Future<ApiCallResponse> call({
    String? arquivo = '',
    int? codigoArquivo,
    String? nomeArquivo = '',
    String? extensaoArquivo = '',
  }) async {
    final baseUrl = FACConsigGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "arquivo": "${escapeStringForJson(arquivo)}",
  "codigoArquivo": ${codigoArquivo},
  "nomeArquivo": "${escapeStringForJson(nomeArquivo)}",
  "extensaoArquivo": "${escapeStringForJson(extensaoArquivo)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'enviaDocumento',
      apiUrl: '${baseUrl}enviaDocumento',
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

/// End FACConsig Group Code

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

class DadosContratanteCall {
  static Future<ApiCallResponse> call({
    String? cpf = '',
  }) async {
    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DadosContratante',
      apiUrl: 'https://api.facsistemas.com.br/dadosContratante',
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

class AutenticacaoCall {
  static Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "cpf": "${escapeStringForJson(cpf)}",
  "senha": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Autenticacao',
      apiUrl: 'https://api.facsistemas.com.br/autenticaUsuario',
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
