import 'package:Trip/components/custom_back_botton.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/utils/const_class.dart';

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
      titleTextStyle: TextStyle(
          fontSize: CustomFontsTheme.veryBigSize,
          fontFamily: GoogleFonts.cairo().fontFamily,
          color: Theme.of(context).colorScheme.inverseSurface),
      centerTitle: true,
      leadingWidth: 100,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
