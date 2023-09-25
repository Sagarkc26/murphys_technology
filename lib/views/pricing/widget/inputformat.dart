import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the entered text
    final newText = newValue.text;

    // Check if the text contains a '/'
    if (newText.contains('/')) {
      final parts = newText.split('/');
      if (parts.length == 2) {
        final month = int.tryParse(parts[0]);
        final year = int.tryParse(parts[1]);

        // Check if month is greater than 12 or year is too short
        if (month != null && year != null) {
          if (month > 12 || year < 1000) {
            // Prevent entering invalid values
            return oldValue;
          }
        }
      }
    }

    // Allow the input
    return newValue;
  }
}
