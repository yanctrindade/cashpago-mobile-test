// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../resources/colors.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(String) onDateSelected;
  final Function(String) onTimeSelected;

  DatePickerWidget({super.key, required this.onDateSelected, required this.onTimeSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final dateTitle = 'Defina a data:';
  final timeTitle = 'Horário:';

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Date Text Field
        Expanded(
          child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                  dateController.text =
                      DateFormat('dd/MM/yyyy').format(selectedDate!);
                  widget.onDateSelected(dateController.text);
                });
              }
            },
            child: AbsorbPointer(
              child: buildTextFormField(dateTitle, dateController),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Time Text Field
        Expanded(
          child: GestureDetector(
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  );
                },
              );
              if (pickedTime != null && pickedTime != selectedTime) {
                setState(() {
                  selectedTime = pickedTime;
                  timeController.text = DateFormat('HH:mm').format(DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      selectedTime!.hour,
                      selectedTime!.minute));
                      widget.onTimeSelected(timeController.text);
                });
              }
            },
            child: AbsorbPointer(
              child: buildTextFormField(timeTitle, timeController),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormField(String title, TextEditingController controller) {
    return Material(
      elevation: 5.0, // Elevation added here
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            labelText: title,
            labelStyle: const TextStyle(color: CPColors.primaryBlue, fontSize: 14),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            hintText: title,
            hintStyle: TextStyle(color: CPColors.primaryBlue.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
