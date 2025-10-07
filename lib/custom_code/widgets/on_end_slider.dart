// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class OnEndSlider extends StatefulWidget {
  const OnEndSlider(
      {Key? key,
      this.width,
      this.height,
      this.min = 0.0,
      this.max = 100.0,
      this.initialValue = 50.0})
      : super(key: key);

  final double? width;
  final double? height;
  final double min;
  final double max;
  final double initialValue;

  @override
  State<OnEndSlider> createState() => _OnEndSliderState();
}

class _OnEndSliderState extends State<OnEndSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Slider(
        value: _currentValue,
        min: widget.min,
        max: widget.max,
        onChanged: (value) {},
        onChangeEnd: (value) {
          setState(() {
            _currentValue = value;
          });
        },
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
