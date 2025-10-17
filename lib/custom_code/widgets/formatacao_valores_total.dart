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
import '/custom_code/ApiGate.dart';
import '/custom_code/actions/post_slider_value.dart';
import 'dart:math' as math;
import '/custom_code/live_preview_bus.dart';

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

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  double _allowedMaxFromValorParcela() {
    final dynamic raw = FFAppState().valorParcela;
    if (raw is num) return raw.toDouble();

    // If it's a string like "R$ 1.234,56"
    final s = raw?.toString() ?? '0';
    final cleaned = s.replaceAll(RegExp(r'[^0-9,\.]'), '');
    final normalized = cleaned.replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(normalized) ?? 0.0;
  }

  double _capToValorParcela(double value) {
    final maxAllowed = _allowedMaxFromValorParcela();
    final capped = value > maxAllowed ? maxAllowed : value;
    return double.parse(capped.toStringAsFixed(2));
  }

  double parseFlexibleDouble(dynamic raw) {
    if (raw == null) return 0.0;
    if (raw is num) return raw.toDouble();
    final s0 = raw.toString().trim();
    if (s0.isEmpty) return 0.0;

    // Remove currency/symbols; handle pt_BR and dot-decimal
    final s = s0.replaceAll(RegExp(r'[^0-9,.\-]'), '');
    if (s.contains(',') && s.contains('.')) {
      // assume "1.234,56" -> "1234.56"
      return double.tryParse(s.replaceAll('.', '').replaceAll(',', '.')) ?? 0.0;
    }
    if (s.contains(',')) {
      return double.tryParse(s.replaceAll(',', '.')) ?? 0.0;
    }
    return double.tryParse(s) ?? 0.0;
  }

  Timer? _debounce;

// Add these fields
  bool _requestInFlight = false;
  double? _pendingValue;
  double? _lastSentValue;
  int _latestRequestId = 0;
  DateTime? _lastCallAt;
  static const int minIntervalMs = 2500; // floor between requests
  final int debounceDurationMs = 2000; // comment should say "2 seconds"

  void _handleSliderChange(double value) {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: debounceDurationMs), () async {
      final double finalValue = _capToValorParcela(value);
      final String parcelaStr = finalValue.toStringAsFixed(2);

      // distinct-until-changed (0.01)
      if (_lastSentValue != null &&
          (finalValue - _lastSentValue!).abs() < 0.01) {
        return;
      }

      // min interval guard
      final now = DateTime.now();
      final elapsedMs = now
          .difference(_lastCallAt ?? DateTime.fromMillisecondsSinceEpoch(0))
          .inMilliseconds;
      if (elapsedMs < minIntervalMs) {
        final waitMs = minIntervalMs - elapsedMs;
        _debounce = Timer(Duration(milliseconds: waitMs), () {
          _handleSliderChange(finalValue);
        });
        return;
      }

      // one-in-flight + last-value-wins
      if (_requestInFlight) {
        _pendingValue = finalValue;
        return;
      }
      _requestInFlight = true;
      _lastCallAt = now;
      final int reqId = ++_latestRequestId;

      try {
        final response = await ApiGate.run(() => postSliderValue(
              FFAppState().customSliderValue, // current loan amount
              FFAppState().parcela, // dropdown selection
              'porValorParcela',
              '21220',
              parcelaStr, // parcela value typed (capped)
            ));

        if ((response['statusCode'] as int?) == 429) {
          ApiGate.backoffFromHeaders(response['headers'] as Map?);
          return; // gate will delay the next attempt globally
        }

        // ignore stale responses
        if (reqId != _latestRequestId) return;

        // 429 backoff
        final status = response['statusCode'] as int?;
        if (status == 429) {
          final headers = (response['headers'] ?? {}) as Map?;
          final retryAfterRaw = headers?['retry-after']?.toString() ??
              headers?['Retry-After']?.toString();
          final retryAfter = int.tryParse(retryAfterRaw ?? '') ?? 3;
          await Future.delayed(Duration(seconds: retryAfter));
          _requestInFlight = false; // allow retry
          _handleSliderChange(finalValue); // retry
          return;
        }

        _lastSentValue = finalValue;

        // authoritative updates from API
        final dynamic rawValor = response['body']?['dados']?['valorEmprestimo'];
        final double valorEmprestimo = parseFlexibleDouble(rawValor);

        FFAppState().update(() {
          FFAppState().totalParcela =
              response['body']?['dados']?['valorEmprestimoForma'];
          FFAppState().valorParcela =
              response['body']?['dados']?['valorParcela'];
          FFAppState().customSliderValue = valorEmprestimo;
        });
      } finally {
        _requestInFlight = false;

        // send only the latest queued value
        if (_pendingValue != null) {
          final double v = _pendingValue!;
          _pendingValue = null;
          _handleSliderChange(v);
        }
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FormatacaoValoresTotal oldWidget) {
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
    return AnimatedBuilder(
      animation: LivePreviewBus.I,
      builder: (context, _) {
        final String display = LivePreviewBus.I.formattedDraft ?? _controller.text;
        if (_controller.text != display) {
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
      onEditingComplete: () {
        final double v = (FFAppState().ValorFormatado as double?) ?? 0.0;
        _handleSliderChange(v); // single call after user finishes typing
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
          }

          // Keep caret position relative to the end of the string
          final int selectionIndexFromTheRight =
              newValue.text.length - newValue.selection.extentOffset;

          // Parse digits -> value (pt_BR)
          final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
          final double rawValue =
              (double.tryParse(digitsOnly.isEmpty ? '0' : digitsOnly) ?? 0) /
                  100.0;

          // Cap to your allowed max (using your cap helper)
          final double cappedValue = _capToValorParcela(rawValue);

          // Format and build final text
          final f = NumberFormat("#,##0.00", "pt_BR");
          final String finalFormattedText = 'R\$ ${f.format(cappedValue)}';

          // Update draft and numeric state for other components
          FFAppState().ValorFormatado = cappedValue;
          LivePreviewBus.I.setDraft(cappedValue, finalFormattedText);

          // Restore caret relative to end, clamped to bounds
          final int newOffset =
              ((finalFormattedText.length - selectionIndexFromTheRight)
                  .clamp(0, finalFormattedText.length) as int);
          return TextEditingValue(
            text: finalFormattedText,
            selection: TextSelection.collapsed(offset: newOffset),
          );
        })
      ],
        );
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
