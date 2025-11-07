// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// create an custom action that receives a base64 string and returns it as a flutterflow type UploadedFile
import 'dart:convert';
import 'dart:typed_data';

Future<FFUploadedFile?> base64UploadedFile(
    String base64String, String ext) async {
  try {
    // Remove data URL prefix if present (e.g., "data:image/png;base64,")
    String cleanBase64 = base64String;
    cleanBase64 = cleanBase64.replaceAll(RegExp(r'\s+'), '');
    if (base64String.contains(',')) {
      cleanBase64 = base64String.split(',').last;
    }
    cleanBase64 = cleanBase64.replaceAll('\\n',
        ''); // Removes the literal two-character string: backslash followed by 'n'
    cleanBase64 = cleanBase64.replaceAll('\\r', '');
    cleanBase64 = cleanBase64.replaceAll('\\', '');
    // Decode base64 string to bytes
    Uint8List bytes = base64Decode(cleanBase64);

    // Determine file extension from data URL or default to generic
    String extension;
    String? mimeType;

    if (ext == 'png') {
      extension = 'png';
      mimeType = 'image/png';
    } else if (ext == 'jpeg' || ext == 'jpg') {
      extension = 'jpg';
      mimeType = 'image/jpeg';
    } else if (ext == 'pdf') {
      extension = 'pdf';
      mimeType = 'application/pdf';
    } else if (ext == 'plain') {
      extension = 'txt';
      mimeType = 'text/plain';
    } else {
      extension = 'bin';
    }

    // Create FFUploadedFile
    FFUploadedFile uploadedFile = FFUploadedFile(
      name: 'file_${DateTime.now().millisecondsSinceEpoch}.$extension',
      bytes: bytes,
    );

    return uploadedFile;
  } catch (e) {
    print('Error converting base64 to FFUploadedFile: $e');
    return null;
  }
}
