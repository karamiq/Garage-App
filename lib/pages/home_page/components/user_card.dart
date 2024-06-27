import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import 'card_info_container.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.cardNumber,
    required this.cardMoney,
    required this.expireDate,
    required this.carType,
    required this.carPlateInfo,
  });

  final String cardNumber;
  final String cardMoney;
  final String expireDate;
  final String carType;
  final String carPlateInfo;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: CustomCardClipper(),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.small, vertical: Insets.exSmall),
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  CoustomBorderTheme.normalBorderRaduis),
                            ),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.shadow),
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'رقم البطاقة: ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        //Data comming from api
                        Text(
                          cardNumber,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontWeight: CustomFontsTheme.bigWeight,
                            fontSize: CustomFontsTheme.mediumSize,
                          ),
                        ),
                      ],
                    ),
                    Gap(Insets.small),
                     Text(
                  'رصيد البطاقة',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: CustomFontsTheme.mediumSize,
                  ),
                ),
                    Text(
                      'د.ع $cardMoney',
                      style: TextStyle(
                        fontSize: CustomFontsTheme.bigSize,
                        fontWeight: CustomFontsTheme.bigWeight,
                      ),
                    ),
                  ],
                ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                  children: [
                    CardInfoContainer(text: carType),
                    Gap(Insets.small),
                    CardInfoContainer(text: carPlateInfo)
                  ],
                ),
                Gap(Insets.small),
                CardInfoContainer(text: 'انتهاء الصلاحية:$expireDate'),
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
   

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
