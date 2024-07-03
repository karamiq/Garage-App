import 'package:flutter/material.dart';

import '../../../../config/constant.dart';
import '../../../../config/utils/const_class.dart';

class NotificationsContent extends StatelessWidget {
  const NotificationsContent({
    super.key,
    required this.notifications,
  });

  final List<Widget> notifications;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.separated(
      padding: EdgeInsets.symmetric(vertical: Insets.medium),
      itemCount: notifications.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => notifications[index],
      separatorBuilder: (context, index) => Gap(Insets.small),
    ));
  }
}
