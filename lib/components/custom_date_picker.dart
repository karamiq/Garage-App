import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_form_field.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key,
      required this.onSelect,
      required this.labelText,
      required this.controller,
      required this.prefixIcon,
      this.validator});
  final void Function(String value) onSelect;
  final String labelText;
  final TextEditingController controller;
  final String prefixIcon;
  final String? Function(String?)? validator;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
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
        DateTime? dateTime = await showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            context: context,
            initialDate: DateTime(2004, 11, 11),
            firstDate: DateTime(1950),
            lastDate: DateTime.now());
        if (dateTime != null) {
          String formattedDate = DateFormat('yyyy-mm-dd').format(dateTime);
          print(formattedDate);
          setState(() {
            formattedDate;
            widget.onSelect(formattedDate);
          });
        }
      },
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
