// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> generateNumberRangeAction(String start, String end) async {
  final intStart = int.tryParse(start);
  final intEnd = int.tryParse(end);

  if (intStart == null || intEnd == null || intStart > intEnd) return;

  final range =
      List.generate(intEnd - intStart + 1, (i) => (intStart + i).toString());

  FFAppState().update(() {
    FFAppState().dropDownList = range;
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
