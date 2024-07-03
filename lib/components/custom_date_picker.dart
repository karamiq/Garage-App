import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_form_field.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
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
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Insets.exSmall),
      child: TextFormField(
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
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime.now());
          if (dateTime != null) {
            String formattedDate = DateFormat('yyyy-mm-dd').format(dateTime);
            setState(() {
              widget.controller.text = formattedDate;
              print(widget.controller.text);
            });
          }
        },
        controller: widget.controller,
        validator: widget.validator,
      ),
    );
  }
}
