import 'package:Trip/model/Profiles/profile.dart';
import '../../client/base_client.dart';

class ProfileService {
  static Future<Profile> profileGet() async {
    final response = await BaseClient.get(api: EndPoints.profiles);
    dynamic dataList = response;
    Profile home = Profile.fromJson(dataList);
    return home;
  }
}
