import 'package:flutter/foundation.dart';

class LivePreviewBus extends ChangeNotifier {
  LivePreviewBus._internal();
  static final LivePreviewBus I = LivePreviewBus._internal();

  double? numericDraft;
  String? formattedDraft;

  void setDraft(double numeric, String formatted) {
    numericDraft = numeric;
    formattedDraft = formatted;
    notifyListeners();
  }

  void clear() {
    numericDraft = null;
    formattedDraft = null;
    notifyListeners();
  }
}
