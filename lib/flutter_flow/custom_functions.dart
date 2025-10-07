import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? doubleParaString(double value) {
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );
  return formatter.format(value);
}

double? stringDoubleSFomart(String value) {
  if (value == null || value.isEmpty) return 0.0;

  String cleaned = value.replaceAll("R\$", "").trim();

  if (cleaned.contains(",")) {
    // Formato BR: 183.038,91
    cleaned = cleaned.replaceAll(".", "").replaceAll(",", ".");
  }
  // Se não tem vírgula, assume que já está no padrão US (183038.91)

  return double.tryParse(cleaned) ?? 0.0;
}
