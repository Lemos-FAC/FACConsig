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

Timer? _debounce;

Future<dynamic> postSliderValueDebounced(
  double value,
  String parcela,
  String contratante,
  String apiUrl,
  String token,
) async {
  // Cancel any existing timer
  _debounce?.cancel();

  final completer = Completer<Map<String, dynamic>>();

  _debounce = Timer(const Duration(milliseconds: 500), () async {
    try {
      final uri = Uri.parse(apiUrl);

      final headers = {
        'Content-Type': 'application/json',
        if (token.isNotEmpty) 'Authorization': 'Basic $token',
      };

      final body = jsonEncode({
        'contratante': contratante,
        'tipoSimulacao': "porValorSolicitado",
        'quantidadeParcelas': parcela,
        'valorEmprestimo': value,
        'valorParcelas': null
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
  });

  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
