// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<dynamic> postSliderValue(double value, String parcela,
    String tipoSimulacao, String contratante, String valorParcela) async {
  final completer = Completer<Map<String, dynamic>>();
  try {
    final uri = Uri.parse('https://api.facsistemas.com.br/simulaEmprestimo');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ZmFjQ29udHJhdGFudGU6ODhiMzMyODNiOTEzYjY1Mzc3NGMyODZjNzkxN2Y1ZmQ=',
    };

    final body = jsonEncode({
      'contratante': contratante,
      'tipoSimulacao': tipoSimulacao,
      'quantidadeParcelas': parcela,
      'valorEmprestimo': value,
      'valorParcelas': valorParcela
    });

    final response = await http
        .post(uri, headers: headers, body: body)
        .timeout(const Duration(seconds: 10));

    completer.complete({
      'status': response.statusCode,
      'body': jsonDecode(response.body),
    });
  } catch (e) {
    completer.complete({
      'status': 500,
      'body': 'Erro na requisição: $e',
    });
  }

  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
