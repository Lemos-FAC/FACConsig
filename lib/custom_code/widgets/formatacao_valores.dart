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
import 'package:provider/provider.dart';
import 'dart:async';
import '/custom_code/live_preview_bus.dart';

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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  Timer? _debounceCommit;
  double? _lastCommitted;
  static const int commitDebounceMs = 900;

  double _capToCeiling(double v) {
    final f = NumberFormat("#,##0.00", "pt_BR");
    final s = (FFAppState().totalParcela ?? 'R\$ 0,00')
        .toString()
        .replaceAll('R\$ ', '');
    final ceiling = f.parse(s).toDouble();
    final capped = (ceiling > 0 && v > ceiling) ? ceiling : v;
    return double.parse(capped.toStringAsFixed(2));
  }

  void _scheduleDebouncedCommit(double value) {
    _debounceCommit?.cancel();
    _debounceCommit = Timer(const Duration(milliseconds: commitDebounceMs), () {
      final v = _capToCeiling(value);
      if (_lastCommitted != null && (v - _lastCommitted!).abs() < 0.01) return;
      _lastCommitted = v;
      FFAppState().update(() {
        FFAppState().customSliderValue = v;
      });
    });
  }

  @override
  void dispose() {
    _debounceCommit?.cancel();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
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
    context.watch<FFAppState>(); // react to preview/auth updates

    final String preview = (FFAppState().valorParcelaAlterado ??
            widget.initialText /* totalParcela */)
        .toString();

    if (!_focusNode.hasFocus && _controller.text != preview) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _controller.value = _controller.value.copyWith(
          text: preview,
          selection: TextSelection.collapsed(offset: preview.length),
          composing: TextRange.empty,
        );
      });
    }
    return AnimatedBuilder(
      animation: LivePreviewBus.I,
      builder: (context, _) {
        // Prefer live draft if user is dragging
        final String display = LivePreviewBus.I.formattedDraft ?? preview;
        if (!_focusNode.hasFocus && _controller.text != display) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _controller.value = _controller.value.copyWith(
              text: display,
              selection: TextSelection.collapsed(offset: display.length),
              composing: TextRange.empty,
            );
          });
        }
        return TextField(
      controller: _controller,
      onEditingComplete: () async {
        final typed = (FFAppState().ValorFormatado as double?) ?? 0.0;
        final capped = _capToCeiling(typed);
        FFAppState().update(() {
          FFAppState().customSliderValue =
              capped; // slider will mirror via initialValue
        });
        FocusScope.of(context).unfocus();
      },
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
          } else if (newValue.text != oldValue.text) {
            final f = NumberFormat("#,##0.00", "pt_BR");

            // 1) Parse digits -> double
            final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
            final int rawNumber = int.tryParse(digitsOnly) ?? 0;
            final double rawDoubleValue = rawNumber / 100.0;

            // 2) Ceiling from totalParcela
            final totalParcelaString =
                (FFAppState().totalParcela ?? 'R\$ 0,00').toString();
            final double ceilingValue =
                f.parse(totalParcelaString.replaceAll('R\$ ', '')).toDouble();

            // 3) Cap
            double finalValue = rawDoubleValue;
            bool wasCapped = false;
            if (ceilingValue > 0.0 && finalValue > ceilingValue) {
              finalValue = ceilingValue;
              wasCapped = true;
            }

            // 4) Stage only + debounce commit
            FFAppState().ValorFormatado = finalValue;

            // 5) Format + caret
            final newString = f.format(finalValue);
            final full = 'R\$ ' + newString;

            final selectionIndexFromTheRight =
                newValue.text.length - newValue.selection.extentOffset;
            final desiredOffset = wasCapped
                ? full.length
                : full.length - selectionIndexFromTheRight;
            final int safeOffset = (desiredOffset.clamp(0, full.length)) as int;
            // Update draft so other viewers reflect local typing too
            LivePreviewBus.I.setDraft(finalValue, full);

            return TextEditingValue(
              text: full,
              selection: TextSelection.collapsed(offset: safeOffset),
            );
          } else {
            return newValue;
          }
        })
      ],
        );
      },
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
