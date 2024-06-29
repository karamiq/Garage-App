import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_list_tile.dart';
import '../../config/constant.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Widget> notifications = [
    /* CustomListTile(
        icon: Assets.assetsIconsCard,
        title: 'تم شحن البطاقة',
        subtitle: '2023/2/24',
        trailing2: '25,000 د. ع.'),
    CustomListTile(
        icon: Assets.assetsIconsCard,
        title: 'تم شحن البطاقة',
        subtitle: '2023/2/24',
        trailing2: '25,000 د. ع.'),
    CustomListTile(
        icon: Assets.assetsIconsCard,
        title: 'تم شحن البطاقة',
        subtitle: '2023/2/24',
        trailing2: '25,000 د. ع.'),
    CustomListTile(
        icon: Assets.assetsIconsCard,
        title: 'تم شحن البطاقة',
        subtitle: '2023/2/24',
        trailing2: '25,000 د. ع.'),
        */
  ];

  Future<void> _refresh() async {
    //await feachData();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = 300;
    return Scaffold(
      appBar: CustomAppBar(title: 'الأشعارات'),
      body: notifications.isNotEmpty
          ? SingleChildScrollView(
              child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: Insets.medium),
              itemCount: notifications.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => notifications[index],
              separatorBuilder: (context, index) => Gap(Insets.small),
            ))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: height,
                      width: height,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(.1),
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
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
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
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            Theme.of(context)
                                                .colorScheme
                                                .surface,
                                          ])),
                                  child: Center(
                                      child: Container(
                                    width: height * .55,
                                    padding:
                                        EdgeInsets.all(Insets.medium * 2.3),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                                    child: Container(
                                      padding:
                                          EdgeInsets.all(Insets.medium * 1),
                                      width: height * .3,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
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
            ),
    );
  }
}
