import 'package:Trip/components/custom_back_botton.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      title: title == null ? null : Text(title!),
      titleTextStyle: TextStyle(
          fontSize: CustomFontsTheme.bigSize,
          fontFamily: GoogleFonts.cairo().fontFamily,
          color: Theme.of(context).colorScheme.inverseSurface),
      centerTitle: true,
      leadingWidth: 70,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
