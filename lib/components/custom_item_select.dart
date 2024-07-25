import 'package:flutter/material.dart';

import '../config/constant.dart';
import 'custom_text_form_field.dart';

class CustomApiItemSelect extends StatelessWidget {
  CustomApiItemSelect({
    super.key,
    required this.labelText,
    required this.controller,
    required this.itemListFuture,
    required this.validator,
    this.onChanged,
    this.prefixIcon,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final Future<List<dynamic>> itemListFuture;
  final String? prefixIcon;
  Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: CustomInputDecoration(
          labelText: labelText, prefixIcon: prefixIcon, context: context),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: () async {
        dynamic result = await customBottomSheet(
          context,
          child: showSelectionBottomSheet(
            itemListFuture: itemListFuture,
            controller: controller,
          ),
        );
        if (onChanged != null) {
          onChanged!(result);
        }
      },
    );
  }
}

class showSelectionBottomSheet extends StatefulWidget {
  const showSelectionBottomSheet(
      {super.key, required this.itemListFuture, required this.controller});

  final Future<List<dynamic>> itemListFuture;
  final TextEditingController controller;

  @override
  _showSelectionBottomSheetState createState() =>
      _showSelectionBottomSheetState();
}

class _showSelectionBottomSheetState extends State<showSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredCountries = [];
  List<dynamic> _originalList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterCountries(_searchController.text);
    });
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = _originalList
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
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
    return FutureBuilder<List<dynamic>>(
      future: widget.itemListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No items available'));
        } else {
          if (_originalList.isEmpty) {
            _originalList = snapshot.data!;
            _filteredCountries = _originalList;
          }
          double height = 600;
          if (_originalList.length <= 4) {
            height = 300;
          } else if (_originalList.length <= 8 && _originalList.length >= 4) {
            height = 450;
          } else {
            height = 500;
          }

          return Container(
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top:
                        Radius.circular(CustomBorderTheme.normalBorderRadius))),
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
                      return ListTile(
                        title: Text(_filteredCountries[index].name),
                        onTap: () {
                          widget.controller.text =
                              _filteredCountries[index].name;
                          Navigator.of(context).pop(_filteredCountries[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
