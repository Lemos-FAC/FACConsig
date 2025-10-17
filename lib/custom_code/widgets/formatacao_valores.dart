// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '../../pages/emprestimo/emprestimo_model.dart';
// export '../../pages/emprestimo/emprestimo_model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormatacaoValores extends StatefulWidget {
  const FormatacaoValores({
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
  _FormatacaoValoresState createState() => _FormatacaoValoresState();
}

class _FormatacaoValoresState extends State<FormatacaoValores> {
  double radius = 0.0;
  Color cor = Colors.black;
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
    _controller.addListener(() {
      final text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void didUpdateWidget(covariant FormatacaoValores oldWidget) {
    super.didUpdateWidget(oldWidget);

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
            final f = NumberFormat("#,##0.00", "pt_BR");

            // --- 1. CLEAN AND PARSE USER INPUT ---
            final String cleanDigits =
                newValue.text.replaceAll(RegExp(r'\D'), '');
            final int rawNumber = int.tryParse(cleanDigits) ?? 0;
            double rawDoubleValue = rawNumber / 100;

            // --- 2. CLEAN AND PARSE CEILING VALUE (totalParcela) ---
            final String totalParcelaString =
                FFAppState().totalParcela ?? 'R\$ 0,00';

            // Use NumberFormat.parse to safely handle the "R$ 0.000,00" format
            final double ceilingValue =
                f.parse(totalParcelaString.replaceAll('R\$ ', '')).toDouble();

            // --- 3. DETERMINE FINAL VALUE (CAP IT) ---
            double finalValue = rawDoubleValue;
            bool wasCapped = false;

            if (ceilingValue > 0.0 && rawDoubleValue > ceilingValue) {
              finalValue = ceilingValue;
              wasCapped = true;
            }

            // --- 4. UPDATE APP STATE ---
            FFAppState().update(() {
              FFAppState().customSliderValue = finalValue;
            });
            FFAppState().ValorFormatado = finalValue;

            // --- 5. FORMAT AND RETURN ---
            final newString = f.format(finalValue);

            // Handle cursor position
            final int selectionIndexFromTheRight =
                newValue.text.length - newValue.selection.extentOffset;

            // If the value was capped, place the cursor at the end for a clean reset
            final int cursorOffset = wasCapped
                ? ('R\$ ' + newString).length
                : ('R\$ ' + newString).length - selectionIndexFromTheRight;

            return TextEditingValue(
              text: 'R\$ ' + newString,
              selection: TextSelection.collapsed(offset: cursorOffset),
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
