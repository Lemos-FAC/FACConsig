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
import '/custom_code/widgets/formatacao_valores.dart';
import '/custom_code/widgets/formatacao_valores_total.dart';
import 'package:intl/intl.dart';
import 'dart:async';

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
  final Future<dynamic> Function(dynamic apiResponse)? onApiSuccess;

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
  final int debounceDurationMs = 2000; // 0.5 seconds

// This function handles both the text update and the debounced API call
  void _handleSliderChange(double value) async {
    // 1. Cancel any existing timer to prevent a prior call from firing
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // 2. Set a new timer to fire the API logic after the debounce delay
    _debounce = Timer(Duration(milliseconds: debounceDurationMs), () async {
      double finalValue = _capValueToMax(value);
      double previousLoanValue = FFAppState().customSliderValue;

      // // Check if the value has genuinely changed before making the API call
      // // The previous check you had is good, but we ensure it's on the debounced value.
      // if (finalValue != previousLoanValue) {
      //   // 3. API Call (will run only after the user stops for 500ms)
      final response = await postSliderValue(
          finalValue, FFAppState().parcela, 'porValorSolicitado', '21220', '');

      //   // 4. Final App State Update
      //   FFAppState().update(() {
      //     FFAppState().customSliderValue = finalValue;
      //     FFAppState().valorParcela =
      //         response['body']?['dados']?['valorParcela'];
      //     FFAppState().totalParcela =
      //         response['body']?['dados']?['valorEmprestimoForma'];
      //   });
      // }
      // final response = await postSliderValue(...);

      // 2. PASS RESPONSE OUT using a new Action parameter
      if (widget.onApiSuccess != null) {
        // Assume you created this
        widget.onApiSuccess!(response);
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
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Slider(
        activeColor: FlutterFlowTheme.of(context).primary,
        inactiveColor: const Color(0xFF97bba7),
        min: widget.min ?? 0.0,
        max: widget.max ?? 0.0,
        value: finalSliderValue,
        onChanged: (value) async {
          final formatter = NumberFormat.currency(
            locale:
                'pt_BR', // Brazilian locale for separators (comma as decimal, dot as thousands)
            symbol: 'R\$ ', // Currency symbol with a space
            decimalDigits: 2, // Rounds to two decimal places
          );
          setState(() {
            _currentValue = _capValueToMax(value);
          });
          FFAppState().update(() {
            // FFAppState().totalParcela = formatter.format(value);
            // FFAppState().displayValue = formatter.format(value);
          });
        },
        onChangeEnd: (newValue) async {
          _handleSliderChange(newValue);
        },
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
