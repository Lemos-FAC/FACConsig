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
import '/custom_code/ApiGate.dart';

class DynamicDropdownFF extends StatefulWidget {
  const DynamicDropdownFF(
      {Key? key,
      this.width,
      this.height,
      required this.options, // Parameter: List of Strings for dropdown options
      this.initialValue // Parameter: Optional initial selected value
      // required this.onOptionSelected, // Action: Callback for when an option is selected
      })
      : super(key: key);

  final double? width;
  final double? height;
  final List<String>
      options; // Corresponds to your 'dropDownList' from App State
  final String? initialValue;
  // final Future<dynamic> Function(String) onOptionSelected; // FF Action callback

  @override
  State<DynamicDropdownFF> createState() => _DynamicDropdownFFState();
}

class _DynamicDropdownFFState extends State<DynamicDropdownFF> {
  String?
      _selectedValue; // Internal state to manage the currently selected item
  @override
  void initState() {
    super.initState();
    _initializeSelectedValue();
  }

  // This method ensures the dropdown updates if its options or initial value
  // change externally (e.g., if you update App State).
  @override
  void didUpdateWidget(covariant DynamicDropdownFF oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only re-initialize if the options list or initialValue has changed
    if (oldWidget.options != widget.options ||
        oldWidget.initialValue != widget.initialValue) {
      _initializeSelectedValue();
    }
  }

  // Helper to set _selectedValue based on initialValue and current options
  void _initializeSelectedValue() {
    setState(() {
      if (widget.initialValue != null &&
          widget.options.contains(widget.initialValue)) {
        // If an initial value is provided and is valid, use it.
        _selectedValue = widget.initialValue;
      } else if (widget.options.isNotEmpty) {
        // Otherwise, if options exist, select the first one.
        _selectedValue = widget.options.first;
      } else {
        // If no options, set to null.
        _selectedValue = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // If there are no options, display a placeholder to prevent errors
    if (widget.options.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height ?? 50, // Default height if not specified
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Text(
          'No options available',
          style: FlutterFlowTheme.of(context).bodySmall?.copyWith(
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0), // A rounded border
        border: Border.all(
          color:
              FlutterFlowTheme.of(context).alternate, // A subtle border color
          width: 1.0,
        ),
      ),
      child: DropdownButtonHideUnderline(
        // Hides the default underline
        child: DropdownButton<String>(
          value: _selectedValue, // The currently selected value
          icon: Icon(
            Icons.keyboard_arrow_down_rounded, // Custom dropdown icon
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
          elevation: 2, // Shadow depth of the opened menu
          style: FlutterFlowTheme.of(context)
              .bodyMedium, // Text style for selected item
          dropdownColor: FlutterFlowTheme.of(context)
              .secondaryBackground, // Background of the opened menu
          isExpanded: true, // Makes the dropdown take available width

          onChanged: (String? newValue) async {
            if (newValue != null) {
              setState(() {
                _selectedValue = newValue;
                FFAppState().parcela = newValue;
              });
              // Call the FlutterFlow action with the new value
              // await widget.onOptionSelected(newValue);

              // 2. Call the API with global gating/backoff
              final response = await ApiGate.run(() => postSliderValue(
                    FFAppState().customSliderValue,
                    _selectedValue ?? '0',
                    'porQtdeParcelas',
                    '21220',
                    '',
                  ));
              if ((response['statusCode'] as int?) == 429) {
                ApiGate.backoffFromHeaders(response['headers'] as Map?);
                return;
              }
              // 3. Update App State
              FFAppState().update(() {
                FFAppState().maxAllowedValue = double.tryParse(
                        response['body']?['dados']?['valorEmprestimo']) ??
                    0.0;
                FFAppState().parcela = newValue;
                // // FIX: Safely parse the String into a Double for FFAppState().customSliderValue
                FFAppState().customSliderValue = double.tryParse(
                        response['body']?['dados']?['valorEmprestimo']) ??
                    0.0;

                FFAppState().totalParcela =
                    response['body']?['dados']?['valorEmprestimoForma'];
                FFAppState().valorParcela =
                    response['body']?['dados']?['valorParcela'];
              });
            }
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: FlutterFlowTheme.of(context)
                    .bodyMedium, // Text style for items in the list
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
