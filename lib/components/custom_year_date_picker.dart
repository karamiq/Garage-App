import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_form_field.dart';

class CustomYearDatePicker extends StatefulWidget {
  const CustomYearDatePicker(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.prefixIcon,
      required this.validator});
  final String labelText;
  final TextEditingController controller;
  final String prefixIcon;
  final String? Function(String?) validator;

  @override
  State<CustomYearDatePicker> createState() => _CustomYearDatePickerState();
}

class _CustomYearDatePickerState extends State<CustomYearDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      keyboardType: TextInputType.datetime,
      decoration: CustomInputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        context: context,
      ),
      onTap: () async {
        int initialYear =
            int.tryParse(widget.controller.text) ?? DateTime.now().year;

        int? selectedYear = await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            return YearPickerDialog(
              initialYear: initialYear,
              onYearSelected: (int year) {
                widget.controller.text = year.toString();
              },
            );
          },
        );

        if (selectedYear != null) {
          String formattedDate =
              DateFormat('yyyy').format(DateTime(selectedYear));
          setState(() {
            widget.controller.text = formattedDate;
            print(widget.controller.text);
          });
        }
      },
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}

class YearPickerDialog extends StatelessWidget {
  final int initialYear;
  final ValueChanged<int> onYearSelected;

  const YearPickerDialog({
    Key? key,
    required this.initialYear,
    required this.onYearSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: YearPicker(
        selectedDate: DateTime(initialYear),
        firstDate: DateTime(1950),
        lastDate: DateTime(DateTime.now().year),
        onChanged: (DateTime dateTime) {
          onYearSelected(dateTime.year);
          Navigator.pop(context);
        },
      ),
    );
  }
}
