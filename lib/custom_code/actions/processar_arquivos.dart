// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // Necessário para a conversão Base64

// O retorno pode ser 'void' se você só estiver atualizando o App State
Future processarArquivos(
  List<FFUploadedFile> arquivosCarregados,
  int codigoDoc,
  String extensao,
) async {
  // Itera sobre a lista de arquivos
  for (final arquivoItem in arquivosCarregados) {
    // 1. CONVERSÃO BASE64: Usa a biblioteca Dart 'convert' diretamente
    // Note: 'bytes' é a propriedade que contém o conteúdo binário do arquivo carregado
    final base64String = base64Encode(arquivoItem.bytes!);

    // 2. ADIÇÃO ATÔMICA À LISTA DO APP STATE
    // Cria a estrutura de dados correta com o valor Base64 ÚNICO
    FFAppState().addToListaArquivos(ItemArquivoStruct(
        codigoArquivo: codigoDoc,
        nomeArquivo: arquivoItem.name, // Nome original do arquivo
        extensaoArquivo: extensao,
        arquivo: base64String)); // Valor Base64 correto para o item atual
  }
  // O App State é atualizado dentro do loop, sem variáveis de estado de página.
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
