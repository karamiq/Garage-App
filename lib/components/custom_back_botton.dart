import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(Insets.medium),
        IconButton.outlined(
          onPressed: () => Get.back(),
          icon: Icon(Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
              ),
              side: BorderSide(
                  width: 2, color: Theme.of(context).colorScheme.primary),
              backgroundColor: Colors.transparent),
        ),
      ],
    );
  }
}
