import 'package:flutter/foundation.dart'; // Required for ValueNotifier

class SliderController {
  // 1. Define the observable variable, initialized to a safe default
  // Use 'late' to promise that it will be initialized before first use.
  late final ValueNotifier<double> sliderValue;

  // Constructor: Initialize the ValueNotifier with a safe default value (0.0).
  SliderController() {
    // You can initialize it here if you prefer a standard default
    sliderValue = ValueNotifier(0.0);
  }

  // 2. Public method to initialize/sync from AppState (called OnPageLoad)
  void initializeFromAppState(double initialValue) {
    sliderValue.value = initialValue;
  }

  // 3. Method for continuous updates (from slider/textfield)
  void updateValue(double newValue) {
    sliderValue.value = newValue;
  }
}

// 4. Create a global instance
final sliderController = SliderController();
