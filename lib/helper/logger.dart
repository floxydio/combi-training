import 'package:flutter/foundation.dart';

class Debug {
  static void debugLog(String log) {
    if (kDebugMode) {
      print(log);
    }
  }
}
