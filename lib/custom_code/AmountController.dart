import 'package:flutter/foundation.dart';

class AmountController {
  final ValueNotifier<double> amountValue = ValueNotifier(0.0);
  final ValueNotifier<double> ceilingValue = ValueNotifier(0.0);

  // 🟢 NEW: Method to initialize state from API data
  void initializeState(double initialAmount, double maxCeiling) {
    // 1. Set the ceiling first
    ceilingValue.value = maxCeiling;

    // 2. Set the initial amount (automatically capped)
    // The updateValue method ensures initialAmount doesn't exceed maxCeiling
    updateValue(initialAmount);
  }

  // Method called by Slider/Dropdown
  void updateValue(double newValue) {
    final double maxLimit = ceilingValue.value;

    // Cap the value: If the new value exceeds the max, set it to the max.
    double cappedValue = (newValue > maxLimit) ? maxLimit : newValue;

    amountValue.value = cappedValue;
  }

  // Method called by the Dropdown/API to change the max allowed (ceiling)
  void setCeiling(double newCeiling) {
    ceilingValue.value = newCeiling;

    // Auto-correct the current amount if the new ceiling is lower
    if (amountValue.value > newCeiling) {
      amountValue.value = newCeiling;
    }
  }
}

final amountController = AmountController();
