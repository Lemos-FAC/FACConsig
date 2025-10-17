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
import '/custom_code/actions/post_slider_value.dart';
import '/custom_code/ApiGate.dart';
import '/custom_code/widgets/formatacao_valores.dart';
import '/custom_code/widgets/formatacao_valores_total.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math' as math;

class OnEndSlider extends StatefulWidget {
  const OnEndSlider(
      {Key? key,
      this.width,
      this.height,
      this.min,
      this.max,
      this.initialValue,
      this.onApiSuccess})
      : super(key: key);

  final double? width;
  final double? height;
  final double? min;
  final double? max;
  final double? initialValue;
  final Future<dynamic> Function(String apiResponse)? onApiSuccess;

  @override
  State<OnEndSlider> createState() => _OnEndSliderState();
}

class _OnEndSliderState extends State<OnEndSlider> {
  late double _currentValue = 0.0;
  late String _parcela = '';

  double _capValueToMax(double value) {
    // Use the hard max from the widget property
    final double maxVal = widget.max ?? 0.0;

    // 1. Cap the raw incoming value first
    double cappedValue = (value > maxVal) ? maxVal : value;

    // 2. Force rounding to 2 decimal places to eliminate floating point error (0.469 -> 0.47)
    // This ensures 245611.469... becomes 245611.46.
    double finalRoundedValue = double.parse(cappedValue.toStringAsFixed(2));

    return finalRoundedValue;
  }

  Timer? _debounce;

// Add these fields
  bool _requestInFlight = false;
  double? _pendingValue;
  double? _lastSentValue;
  int _latestRequestId = 0;
  DateTime? _lastCallAt;

  static DateTime? _globalNextAllowedAt;
  static int _globalBackoffSec = 0;
// raise the floor (server-friendly)
  static const int minIntervalMs = 5000; // was 2500
  final int debounceDurationMs =
      1200; // send sooner after stop, but fewer per minute

  void _retryLater(double v, Duration d) {
    _debounce?.cancel();
    _debounce = Timer(d, () => _handleSliderChange(v));
  }

  void _handleSliderChange(double value) {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: debounceDurationMs), () async {
      final double finalValue = _capValueToMax(value);

      // respect global cooldown (shared across instances/widgets)
      final now = DateTime.now();
      if (_globalNextAllowedAt != null && now.isBefore(_globalNextAllowedAt!)) {
        _retryLater(finalValue, _globalNextAllowedAt!.difference(now));
        return;
      }

      if (_lastSentValue != null && (finalValue - _lastSentValue!).abs() < 0.01)
        return;

      final elapsedMs = now
          .difference(_lastCallAt ?? DateTime.fromMillisecondsSinceEpoch(0))
          .inMilliseconds;
      if (elapsedMs < minIntervalMs) {
        _retryLater(
            finalValue, Duration(milliseconds: minIntervalMs - elapsedMs));
        return;
      }

      if (_requestInFlight) {
        _pendingValue = finalValue;
        return;
      }
      _requestInFlight = true;
      _lastCallAt = now;
      final int reqId = ++_latestRequestId;

      try {
        final response = await ApiGate.run(() => postSliderValue(
              finalValue,
              FFAppState().parcela,
              'porValorSolicitado',
              '21220',
              '',
            ));
        if ((response['statusCode'] as int?) == 429) {
          ApiGate.backoffFromHeaders(response['headers'] as Map?);
          return; // gate will delay the next attempt globally
        }

        if (reqId != _latestRequestId) return;

        final status = response['statusCode'] as int?;
        if (status == 429) {
          final headers = (response['headers'] ?? {}) as Map?;
          final raw = headers?['retry-after']?.toString() ??
              headers?['Retry-After']?.toString();
          final int? headerSec = int.tryParse(raw ?? '');
          final int waitSec = headerSec ??
              (_globalBackoffSec == 0
                  ? 4
                  : (_globalBackoffSec * 2).clamp(4, 60));
          _globalBackoffSec = waitSec;
          _globalNextAllowedAt = DateTime.now().add(Duration(seconds: waitSec));
          _requestInFlight = false;
          _retryLater(
              finalValue, Duration(seconds: waitSec)); // schedule, don't hammer
          return;
        }

        // success => reset backoff and set a gentle floor before next send
        _globalBackoffSec = 0;
        _globalNextAllowedAt = DateTime.now().add(const Duration(seconds: 2));

        _lastSentValue = finalValue;
        // Avoid global rebuilds: assign directly without notifyListeners
        final String? totalForma =
            response['body']?['dados']?['valorEmprestimoForma']?.toString();
        final String? valorParcela =
            response['body']?['dados']?['valorParcela']?.toString();
        if (totalForma != null) {
          FFAppState().totalParcela = totalForma;
        }
        if (valorParcela != null) {
          FFAppState().valorParcela = valorParcela;
        }
        // Notify host optionally without forcing app-wide update
        if (widget.onApiSuccess != null && valorParcela != null) {
          await widget.onApiSuccess!(valorParcela);
        }
      } finally {
        _requestInFlight = false;
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
    _debounce?.cancel(); // Use the correct timer name
    super.dispose();
  }

  @override
  void initState() {
    // 🛑 FIX 1: Apply cap to the initial value (from FF App State/initialValue)
    _currentValue = _capValueToMax(widget.initialValue ?? 0.0);

    // IMPORTANT: You need a NumberFormat instance to parse Brazilian currency
    final parser = NumberFormat("#,##0.00", "pt_BR");
  }

  @override
  void didUpdateWidget(covariant OnEndSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the source of truth (initialValue, which is bound to customSliderValue) has changed
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        // Synchronize the slider's internal position with the new App State value
        _currentValue = _capValueToMax(widget.initialValue ?? 0.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxVal = widget.max ?? 0.0;

    double safeCurrentValue = _currentValue;

    // Cap to maxVal
    if (safeCurrentValue > maxVal) {
      safeCurrentValue = maxVal;
    }

    // Final rounding
    final double finalSliderValue =
        double.parse(safeCurrentValue.toStringAsFixed(2));
    final double capped = _capValueToMax(_currentValue);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          IgnorePointer(
            ignoring:
                _requestInFlight, // optional: prevent new drags while sending
            child: Slider(
              activeColor: FlutterFlowTheme.of(context).primary,
              inactiveColor: const Color(0xFF97bba7),
              min: widget.min ?? 0.0,
              max: widget.max ?? 0.0,
              value: capped,
              onChanged: (v) {
                // final f = NumberFormat("#,##0.00", "pt_BR");
                // setState(() => _currentValue = _capValueToMax(v));
                // FFAppState().update(() {
                //   FFAppState().totalParcela = f.format(v);
                // });
                final ui = _capValueToMax(v);
                setState(() => _currentValue = ui);

                // Avoid notifying listeners during drag to prevent page rebuilds
                // that could trigger repeated API calls in generated widgets.
                // Update local app state fields without notify.
                final f = NumberFormat.currency(
                    locale: 'pt_BR', symbol: 'R\$ ', decimalDigits: 2);
                FFAppState().ValorFormatado = ui; // numeric (no notify)
                FFAppState().valorParcelaAlterado =
                    f.format(ui); // display-only (no notify)
              },
              onChangeEnd: (v) => _handleSliderChange(
                  _capValueToMax(v)), // API logic (debounced/guarded)
            ),
          ),
          if (_requestInFlight) // optional: subtle busy hint
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  color: Colors.black.withOpacity(0.03),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
