import 'package:cashpago_test/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for TextInputFormatter

class CPTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final List<TextInputFormatter>? formatters;
  final FocusNode? focusNode;
  final bool enabled;
  final TextInputType keyboardType;
  final void Function(String)? onEditingCompleteCallback;
  final void Function(String)? onSubmittedCallback;

  final borderStyle = OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none, // No border
            );

  CPTextField({
    super.key,
    required this.controller,
    required this.title,
    this.formatters,
    this.focusNode,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.onEditingCompleteCallback,
    this.onSubmittedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          inputFormatters: formatters,
          enabled: enabled,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.done,
          focusNode: focusNode,
          onEditingComplete: () {
            // This callback is triggered when the user presses "Done" or "Enter"
            if (onEditingCompleteCallback != null) {
              onEditingCompleteCallback!(controller.text);
            }
          },
          onFieldSubmitted: (value) {
            // This callback is triggered when the user submits the text
            if (onSubmittedCallback != null) {
              onSubmittedCallback!(value);
            }
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            labelText: title,
            labelStyle: const TextStyle(fontSize: 14, color: CPColors.primaryBlue),
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey.shade200,
            enabledBorder: borderStyle,
            focusedBorder: borderStyle,
            errorBorder: borderStyle,
            focusedErrorBorder: borderStyle,
            disabledBorder: borderStyle
          ),
        ),
      ),
    );
  }
}
