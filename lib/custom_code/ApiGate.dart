class ApiGate {
  static DateTime? _nextAllowedAt;
  static final List<DateTime> _recent = <DateTime>[];
  static bool _inFlight = false;

  static const int maxPerMinute = 6; // tune to your backend
  static const Duration minInterval = Duration(seconds: 5);

  static Future<T> run<T>(Future<T> Function() send) async {
    // cooldown
    final now = DateTime.now();
    if (_nextAllowedAt != null && now.isBefore(_nextAllowedAt!)) {
      await Future.delayed(_nextAllowedAt!.difference(now));
    }
    // sliding window
    _recent.removeWhere((t) => now.difference(t).inSeconds >= 60);
    if (_recent.length >= maxPerMinute) {
      final wait =
          _recent.first.add(const Duration(minutes: 1)).difference(now);
      await Future.delayed(wait);
    }
    // one-in-flight
    while (_inFlight) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
    _inFlight = true;
    try {
      final res = await send();
      _recent.add(DateTime.now());
      return res;
    } finally {
      _inFlight = false;
    }
  }

  static void backoffFromHeaders(Map? headers) {
    final raw = headers?['retry-after']?.toString() ??
        headers?['Retry-After']?.toString();
    final sec = int.tryParse(raw ?? '') ?? 4;
    _nextAllowedAt = DateTime.now().add(Duration(seconds: sec));
  }
}
