
import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class AccountTypeCard extends StatelessWidget {
  const AccountTypeCard({
    Key? key,
    required this.isOwnerType,
    required this.title,
    required this.subTitle,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  final bool isOwnerType;
  final String title;
  final String subTitle;
  final ValueChanged<bool> onChange;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      surfaceTintColor: Colors.white,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        contentPadding: EdgeInsets.all(Insets.small),
        title: Text(
          title,
          style: TextStyle(
              fontSize: CustomFontsTheme.bigSize,
              fontWeight: CustomFontsTheme.mediumWeight),
        ),
        subtitle: Text(subTitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<bool>(
              groupValue: isOwnerType,
              value: value,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  onChange(newValue);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}