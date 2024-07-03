import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';

import '../model/Profiles/notification.dart';

class NotificationsController extends GetxController {
  var notificationsList = <Notif>[].obs;
  var isLoading = false.obs;

  void getNotifications() async {
    isLoading.value = true;
    try {
      final response = await BaseClient.get(
        api: EndPoints.notifications,
      );

      // Parse response and update notificationsList here
      // notificationsList.value = parsedResponse;

      print(response);
    } catch (e) {
      isLoading.value = false;
      throw e; // Rethrow the error to be caught by the caller
    }
    isLoading.value = false;
  }
}
