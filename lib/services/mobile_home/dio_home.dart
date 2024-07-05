import 'package:Trip/model/Profiles/profile.dart';
import 'package:get/instance_manager.dart';
import '../../client/base_client.dart';
import '../../controller/current_user_controller.dart';

class HomeService {
  late UserController controller;
  HomeService() {
    controller = Get.put<UserController>(UserController());
  }

  static Future<Profile> homeGet() async {
    final response = await BaseClient.get(api: EndPoints.profiles);
    dynamic dataList = response;
    Profile home = Profile.fromJson(dataList);
    return home;
  }

  String? getEndId() {
    // Access controller safely after initialization
    return controller.currentuUser?.vehicle?[0].id;
  }
}
