import 'package:flutter/material.dart';

class AppConverter {
  static String fromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = "${timeOfDay.hour}".padLeft(2, "0");
    final minute = "${timeOfDay.minute}".padLeft(2, "0");
    final time = "$hour:$minute";
    return time;
  }
}
