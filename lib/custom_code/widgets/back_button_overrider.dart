// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart'; // Import this for SystemNavigator

class BackButtonOverrider extends StatefulWidget {
  const BackButtonOverrider({
    super.key,
    this.width,
    this.height,
    this.child, // Add a child so you can wrap your UI
    required this.onBack,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final Future Function() onBack;

  @override
  State<BackButtonOverrider> createState() => _BackButtonOverriderState();
}

class _BackButtonOverriderState extends State<BackButtonOverrider> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Disables system back
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        // Trigger the FlutterFlow Action assigned to 'onBack'
        await widget.onBack();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: widget.child ?? Container(), // Displays your page content
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
