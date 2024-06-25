import 'package:flutter/material.dart';

import '../config/constant.dart';
import 'custom_text_form_field.dart';

class CustomItemSelect extends StatelessWidget {
  const CustomItemSelect(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.itemsList,
      required this.validator,
      this.prefixIcon});
  
  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final List<String> itemsList;
  final String? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: CustomInputDecoration(
          labelText: labelText, prefixIcon: prefixIcon, context: context),
      controller: controller,
      validator: validator,
      onTap: () async {
        final result = await customBottomSheet(
          context,
          child: showSelectionBottomSheet(
            originalList: itemsList,
            controller: controller,
          ),
        );
      },
    );
  }
}

class showSelectionBottomSheet extends StatefulWidget {
  const showSelectionBottomSheet(
      {super.key, required this.originalList, required this.controller});
  
  final List<String> originalList;
  final TextEditingController controller;

  @override
  _showSelectionBottomSheetState createState() =>
      _showSelectionBottomSheetState();
}

class _showSelectionBottomSheetState extends State<showSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  late List<String> _filteredCountries;

  @override
  void initState() {
    super.initState();
    _filteredCountries = widget.originalList;
    _searchController.addListener(() {
      _filterCountries(_searchController.text);
    });
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = widget.originalList
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 600;
    if (widget.originalList.length <= 4) {
      height = 300;
    } else if (widget.originalList.length <= 8 &&
        widget.originalList.length >= 4) {
      height = 450;
    } else {
      height = 500;
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(CoustomBorderTheme.normalBorderRaduis))),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gap(
            CustomPageTheme.meduimPadding,
          ),
          TextField(
            controller: _searchController,
            decoration: CustomInputDecoration(
                isTextField: true,
                labelText: 'بحث',
                prefixIcon: null,
                context: context),
            onChanged: _filterCountries,
          ),
          SizedBox(height: Insets.small),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                var value = _filteredCountries.elementAt(index);
                return ListTile(
                  title: Text(value),
                  onTap: () {
                    // Update the controller value
                    widget.controller.text = value;
                    Navigator.pop(context, value);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
