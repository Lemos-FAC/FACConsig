// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future sharePdfFile(FFUploadedFile uploadedFile) async {
// Check if bytes are available instead of a path
  if (uploadedFile.bytes == null || uploadedFile.bytes!.isEmpty) {
    print('Error: File bytes are missing. Cannot share.');
    return;
  }

  // 1. Get temporary directory
  final tempDir = await getTemporaryDirectory();

  // Use uploadedFile.name (if available) or a generic name
  final fileName = uploadedFile.name?.isNotEmpty == true
      ? uploadedFile.name!
      : 'shared_file.pdf'; // Fallback name

  final path = '${tempDir.path}/$fileName';

  // 2. Write bytes to a local file
  File(path).writeAsBytesSync(uploadedFile.bytes!);

  // 3. Share the local file
  await Share.shareXFiles(
    [XFile(path)],
    text: 'Here is the simulation PDF file.',
    subject: 'PDF Simulation Report',
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
