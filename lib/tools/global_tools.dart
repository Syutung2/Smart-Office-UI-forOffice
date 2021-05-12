import 'package:flutter/material.dart';

class Tools {
  static Widget getState(bool isout) {
    if (isout) {
      return Text(
        "外出中...",
        style: TextStyle(color: Colors.red),
      );
    } else {
      return Text(
        "办公中...",
        style: TextStyle(color: Colors.green),
      );
    }
  }

  static Color getColor(bool ishavepeople) {
    if (!ishavepeople) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.dark;
  }

  static Color getTanChuangColor(BuildContext context) {
    if (isDarkMode(context)) {
      return Colors.black;
    } else {
      return Color.fromARGB(255, 255, 255, 255);
    }
  }
}
