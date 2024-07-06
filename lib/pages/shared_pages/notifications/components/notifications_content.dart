import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/model/Profiles/notification.dart';
import 'package:flutter/material.dart';

import '../../../../config/constant.dart';
import '../../../../config/utils/const_class.dart';

class NotificationsContent extends StatelessWidget {
  const NotificationsContent({
    super.key,
    required this.notifications,
  });

  final List<Notif> notifications;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.separated(
      itemCount: notifications.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => CustomListTile(
          icon: notifications[index].picture,
          title: notifications[index].title,
          subtitle: notifications[index].description,
          trailing2: makeDate(notifications[index].date)),
      separatorBuilder: (context, index) => Gap(Insets.small),
    ));
  }
}
