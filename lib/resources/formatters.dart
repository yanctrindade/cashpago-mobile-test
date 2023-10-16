// ignore_for_file: valid_regexps

import 'package:flutter/services.dart';

class CPFormatters {
  static List<TextInputFormatter>? getCPFFormatters() {
    return [
      FilteringTextInputFormatter.allow(RegExp('[0-9]')), // Only numbers
      TextInputFormatter.withFunction((oldValue, newValue) {
        String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

        // Define your desired maximum length
        const maxLength = 11;

        // If the text exceeds the maximum length, truncate it
        if (newText.length > maxLength) {
          newText = newText.substring(0, maxLength);
        }

        if (newText.length >= 4) {
          newText = '${newText.substring(0, 3)}.${newText.substring(3)}';
        }
        if (newText.length >= 8) {
          newText = '${newText.substring(0, 7)}.${newText.substring(7)}';
        }
        if (newText.length >= 12) {
          newText = '${newText.substring(0, 11)}-${newText.substring(11)}';
        }

        return TextEditingValue(
          text: newText,
          selection: newValue.selection.copyWith(
            baseOffset: newText.length,
            extentOffset: newText.length,
          ),
        );
      }),
    ];
  }

  static List<TextInputFormatter> getDobFormatters() {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(
          RegExp(r'[0-9/]')), // Allow only numbers and /
      LengthLimitingTextInputFormatter(10), // Limit the length to 10 characters
      _DobInputFormatter(),
    ];
  }

  static List<TextInputFormatter>? getPhoneFormatters() {
    return [
      FilteringTextInputFormatter.allow(RegExp('[0-9]')), // Only numbers
      TextInputFormatter.withFunction((oldValue, newValue) {
        String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
        
        // Set the maximum length (e.g., 14 characters for (##) #####-####
        const maxLength = 11;
        if (newText.length > maxLength) {
          newText = newText.substring(0, maxLength);
        }

        if (newText.isNotEmpty) newText = '($newText';

        if (newText.length >= 4) {
          newText = '${newText.substring(0, 3)}) ${newText.substring(3)}';
        }

        if (newText.length >= 11) {
          newText = '${newText.substring(0, 10)}-${newText.substring(10)}';
        }

        return TextEditingValue(
          text: newText,
          selection: newValue.selection.copyWith(
            baseOffset: newText.length,
            extentOffset: newText.length,
          ),
        );
      }),
    ];
  }
}

class _DobInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Ensure the newValue conforms to the "dd/MM/yyyy" format
    
    final formattedText = _formatDateInput(newValue.text);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatDateInput(String input) {
    final strippedInput =
        input.replaceAll(RegExp(r'[^\d]'), ''); // Remove non-digit characters
    final length = strippedInput.length;

    if (length > 2) {
      final day = strippedInput.substring(0, 2);
      final rest = strippedInput.substring(2);

      if (length > 4) {
        final month = rest.substring(0, 2);
        final year = rest.substring(2, rest.length);

        return '$day/$month/$year';
      } else {
        return '$day/$rest';
      }
    }

    return strippedInput; // Input is too short to format
  }
}
