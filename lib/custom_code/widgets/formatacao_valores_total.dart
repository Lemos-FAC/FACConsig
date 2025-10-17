// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class FormatacaoValoresTotal extends StatefulWidget {
  const FormatacaoValoresTotal({
    Key? key,
    this.width,
    this.height,
    required this.radius,
    required this.cor,
    required this.initialText,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double radius;
  final Color cor;
  final String initialText;

  @override
  _FormatacaoValoresTotalState createState() => _FormatacaoValoresTotalState();
}

class _FormatacaoValoresTotalState extends State<FormatacaoValoresTotal> {
  double radius = 0.0;
  Color cor = Colors.black;
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  final TextEditingController _controller = TextEditingController();
  // NEW: Debounce Timer
  Timer? _debounce;
  bool _isTypingLocally = false;
  // Define the duration of inactivity (e.g., 500 milliseconds)
  final Duration _debounceDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  @override
  void didUpdateWidget(covariant FormatacaoValoresTotal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isTypingLocally) {
      return;
    }
    // 1. Check if the value coming from the parent (via App State/Slider) has actually changed
    if (oldWidget.initialText != widget.initialText) {
      // 2. Check if the controller's current text is different from the new App State value.
      // This prevents a loop if the user typed the same value the slider just sent.
      if (_controller.text != widget.initialText) {
        // 3. Set the controller's text to the new value from the slider (via App State).
        // Use the copyWith method to place the cursor at the end.
        _controller.value = _controller.value.copyWith(
          text: widget.initialText,
          selection: TextSelection.collapsed(offset: widget.initialText.length),
          composing: TextRange.empty,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: widget.cor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: widget.cor),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) {
            return newValue.copyWith(text: '');
          } else if (newValue.text.compareTo(oldValue.text) != 0) {
            final int selectionIndexFromTheRight =
                newValue.text.length - newValue.selection.extentOffset;
            final f = NumberFormat("#,##0.00", "pt_BR");
            final number =
                int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
            final newString = f.format(number / 100);
            String finalFormattedText = 'R\$ ' + newString;
            FFAppState().ValorFormatado = number / 100; // Moved this line here
            return TextEditingValue(
              text: finalFormattedText,
              selection: TextSelection.collapsed(
                  // FIX: The offset must be relative to the full string length (finalFormattedText).
                  // The length of finalFormattedText includes "R$ " (3 chars) and all separators.
                  offset:
                      finalFormattedText.length - selectionIndexFromTheRight),
            );
          } else {
            return newValue;
          }
        }),
      ],
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
