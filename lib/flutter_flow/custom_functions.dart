import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String doubleParaString(double value) {
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$ ',
    decimalDigits: 2,
  );
  return formatter.format(value);
}

double? stringDoubleSFomart(String value) {
  if (value.isEmpty) return 0.0;

  String cleaned = value.replaceAll("R\$", "").trim();

  if (cleaned.contains(",")) {
    // Formato BR: 183.038,91
    cleaned = cleaned.replaceAll(".", "").replaceAll(",", ".");
  }

  return double.tryParse(cleaned) ?? 0.0;
}

String? real(String? texto) {
  if (texto == null || texto.isEmpty) return "R\$ 0,00";

  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  try {
    // 1. Parse the string value according to the 'pt_BR' locale.
    //    This correctly interprets "1.234,56" or "R$ 1.234,56" as 1234.56.
    final num parsedValue = formatter.parse(texto);

    // 2. Format the numeric value back into the desired currency string.
    return formatter.format(parsedValue);
  } catch (e) {
    // Return the default value or handle the error if the string is unparsable.
    // print("Error parsing currency string: $e");
    return "R\$ 0,00";
  }
}

String? maskCpf(String cpf) {
// 1. Tratamento de valor nulo, vazio ou inválido
  if (cpf.isEmpty) {
    return '';
  }

  // Remove toda a formatação (pontos e traços)
  String cleanedCpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

  // 2. Verifica se o comprimento é EXATAMENTE 11 dígitos
  if (cleanedCpf.length != 11) {
    // Retorna o valor original se não for um CPF de 11 dígitos
    return cpf;
  }

  // O CPF tem 11 dígitos. A partir daqui, é seguro usar os índices.

  // 3. Extrai as partes necessárias para a máscara usando substring (o método mais seguro)
  // Nota: A string 'cleanedCpf' tem 11 caracteres (índices 0 a 10).

  String part1 = cleanedCpf.substring(0, 3); // Ex: '279'
  String part2 = cleanedCpf.substring(3, 6); // Ex: '104'
  String part3 = cleanedCpf.substring(6, 9); // Ex: '746'
  String part4 = cleanedCpf.substring(9, 11); // Ex: '87'

  // 4. Monta a string no formato exato 27*.***.***-87, mascarando as partes que você deseja.
  // Você só quer o primeiro e o último dígito do primeiro bloco, e o último bloco.

  String firstTwo = cleanedCpf.substring(0, 2); // '27'
  String lastTwo = cleanedCpf.substring(9, 11); // '87'

  // A string '***.***' é uma máscara fixa, não depende dos dados.
  return '$firstTwo*.***.***-$lastTwo';
}

String convertDateFormat(String dateString) {
// Check for empty or null input
  if (dateString.isEmpty) {
    return '';
  }

  try {
    // 1. Define the format of the input string (dd/mm/yyyy)
    final DateFormat inputFormat = DateFormat('dd/MM/yyyy');

    // 2. Parse the input string into a DateTime object
    final DateTime dateTime = inputFormat.parse(dateString);

    // 3. Define the desired output format (yyyy-mm-dd)
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    // 4. Format the DateTime object into the new string format
    return outputFormat.format(dateTime);
  } catch (e) {
    // Return an error message or empty string if parsing fails
    print('Error parsing date: $e');
    return '';
  }
}

String fomataCpf(String inputString) {
// Check for null or empty string to prevent errors
  if (inputString == null || inputString.isEmpty) {
    return '';
  }

  // Use the replaceAll method with a regular expression to remove
  // dots (\\.) and dashes (-) globally.
  // The square brackets [] create a character class matching any character inside.
  String cleaned = inputString.replaceAll(RegExp(r'[.-]'), '');

  return cleaned;
}

int? stringTolnt(String value) {
  String cleanedInput = value?.trim() ?? '';

  // Return the parsed integer or 0 if parsing fails.
  return int.tryParse(cleanedInput) ?? 0;
}

int? cleanAndConvertToInt(String? inputString) {
  if (inputString == null || inputString.isEmpty) {
    return 0;
  }

  // 2. Remove all dashes (-) from the string.
  // Example: "105668-9" becomes "1056689"
  String cleanedString = inputString.replaceAll('-', '');

  // 3. Safely parse the cleaned string into an integer.
  // If parsing fails (e.g., if there were non-numeric characters left),
  // the function returns a default value of 0.
  return int.tryParse(cleanedString) ?? 0;
}

String? converterParaMoeda(
  String? texto,
  bool prefixoRS,
) {
  if (texto == null) return null;
  final apenasNumeros = texto.replaceAll(RegExp(r'[^0-9]'), '');
  final numero = int.parse(apenasNumeros);
  final formatador = NumberFormat.simpleCurrency(locale: 'pt_BR');
  String valorFormatado = formatador.format(numero / 100);
  if (!prefixoRS) {
    valorFormatado = valorFormatado.replaceFirst(r'R$', '');
  }
  return valorFormatado;
}

String? cpf(String input) {
  // criar função que receba uma string de números e retorne essa string formatada da seguinte forma 136.440.146-04

  if (input.length != 11) return null; // Ensure the input has 11 digits
  return '${input.substring(0, 3)}.${input.substring(3, 6)}.${input.substring(6, 9)}-${input.substring(9)}';
}
