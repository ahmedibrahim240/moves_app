import 'package:flutter/material.dart';


extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

void logPrint(String message) {
  debugPrint('\x1B[33mLog ✔ $message \x1B[0m');
}

void logError(String message) {
  debugPrint('\x1B[31m ✔ $message \x1B[0m');
}
