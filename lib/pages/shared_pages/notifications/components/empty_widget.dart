import 'package:flutter/material.dart';

import '../../../../config/constant.dart';

class NotificationsEmptyWidget extends StatelessWidget {
  const NotificationsEmptyWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(.1),
                      offset: Offset(1, 1),
                      blurRadius: 20),
                ],
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: height * .85,
                  width: height * .85,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primaryContainer,
                            Theme.of(context).colorScheme.surface,
                          ])),
                  child: Center(
                    child: Container(
                      height: height * .8,
                      width: height * .8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: height * .6,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    Theme.of(context).colorScheme.surface,
                                  ])),
                          child: Center(
                              child: Container(
                            width: height * .55,
                            padding: EdgeInsets.all(Insets.medium * 2.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.surface),
                            child: Container(
                              padding: EdgeInsets.all(Insets.medium * 1),
                              width: height * .3,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.primary),
                              child: SvgPicture.asset(
                                  Assets.assetsIconsNonotifications),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Gap(Insets.exLarge * 2),
          Text(
            'لا توجد اشعارات',
            style: TextStyle(
              fontSize: CustomFontsTheme.veryBigSize,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'هنا سوف تظهر لك اخر الاشعارات و التنبيهات',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: CustomFontsTheme.mediumSize),
          ),
          Gap(Insets.exLarge * 4),
        ],
      ),
    );
  }
}
