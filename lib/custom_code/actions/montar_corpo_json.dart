// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Esta função recebe a lista de Maps e a EMBRULHA na chave "arquivos"
String montarCorpoJson(List<dynamic> listaDeArquivos) {
  // A lista de arquivos já deve vir como List<Map<String, dynamic>>

  // 1. Cria a estrutura de dados final: {"arquivos": [ ... ]}
  final corpoFinal = {
    "arquivos": listaDeArquivos,
  };

  // 2. Converte essa estrutura em uma string JSON bruta
  return jsonEncode(corpoFinal);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
