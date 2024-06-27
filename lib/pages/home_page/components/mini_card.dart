
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({
    super.key,
    required this.cardTitle,
    required this.cardNumber,
    required this.cardNumText, 
    required this.decoration,
    required this.onIconPressed,
  });

  final Widget decoration;
  final String cardTitle;
  final String cardNumber;
  final String cardNumText;
  final void Function() onIconPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      //padding: EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(
              CoustomBorderTheme.normalBorderRaduis)),
      child: Stack(
        children: [
          decoration,
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(Insets.small),
              child: Text(
                cardTitle,
                style: TextStyle(
                    fontSize: CustomFontsTheme.mediumSize,
                    fontWeight: CustomFontsTheme.mediumWeight),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(Insets.small),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cardNumber,
                          style: TextStyle(
                              fontSize: CustomFontsTheme.bigSize,
                              fontWeight:
                                  CustomFontsTheme.bigWeight),
                        ),
                        Gap(Insets.exSmall),
                        Text(cardNumText),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: onIconPressed,
                      style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .scaffoldBackgroundColor),
                      icon: SvgPicture.asset(
                          Assets.assetsIconsVector),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}