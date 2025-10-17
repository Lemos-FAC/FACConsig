// api_debouncer.dart
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDebouncer {
  // Static timer to persist across function calls
  static Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  // Define the actual API request function
  static Future<Map<String, dynamic>> _executePost(double value, String parcela,
      String tipoSimulacao, String contratante) async {
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
      'valorParcelas': null
    });

    final response = await http
        .post(uri, headers: headers, body: body)
        .timeout(const Duration(seconds: 10));

    return {
      'status': response.statusCode,
      'body': jsonDecode(response.body),
    };
  }

  // The debounced function to be called from the Custom Action
  static Future<dynamic> postSliderValueDebounced(double value, String parcela,
      String tipoSimulacao, String contratante) async {
    // 1. Create a Completer to hold the result until the timer fires
    final completer = Completer<Map<String, dynamic>>();

    // 2. Cancel the previous timer if active
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // 3. Start a new timer
    _debounceTimer = Timer(_debounceDuration, () async {
      try {
        final result =
            await _executePost(value, parcela, tipoSimulacao, contratante);
        completer.complete(result);
      } catch (e) {
        completer.complete({
          'status': 500,
          'body': 'Erro na requisição: $e',
        });
      }
    });

    // 4. Return the Future immediately, which completes when the timer fires
    return completer.future;
  }
}
