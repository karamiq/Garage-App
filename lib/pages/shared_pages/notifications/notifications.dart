import 'package:Trip/components/custom_list_tile_skeleton.dart';
import 'package:Trip/controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_list_tile.dart';
import '../../../config/constant.dart';
import 'components/empty_widget.dart';
import 'components/notifications_content.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  void initState() {
    controller.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الأشعارات'),
      body: Padding(
        padding: EdgeInsets.all(Insets.medium),
        child: Obx(() {
          if (controller.isLoading.value) {
            return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CustomListTileSkeleton(),
                separatorBuilder: (context, index) => Gap(Insets.small),
                itemCount: 11);
          } else if (controller.notificationsList.isEmpty) {
            return NotificationsEmptyWidget(height: 300);
          } else {
            return NotificationsContent(
                notifications: controller.notificationsList);
          }
        }),
      ),
    );
  }
}
