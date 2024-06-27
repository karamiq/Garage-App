
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class HomePageHead extends StatelessWidget {
  const HomePageHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: CoustomBorderTheme.borderWidth / 2)),
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Assets.assetsImagesAvatarImage))),
      trailing: IconButton(
          onPressed: () {},
          icon: IconButton(
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        CoustomBorderTheme.normalBorderRaduis),
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 1,
                  shadowColor: Theme.of(context).colorScheme.shadow),
              onPressed: () {},
              icon: SvgPicture.asset(Assets.assetsIconsNotification))),
    );
  }
}
