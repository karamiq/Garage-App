import 'package:Trip/components/custom_back_botton.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title!),
      centerTitle: true,
      leadingWidth: 100,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
