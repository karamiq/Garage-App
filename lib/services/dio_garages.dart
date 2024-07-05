import 'package:Trip/model/MobileUtils/garages.dart';

import '../client/base_client.dart';

class GaragesSrvce {
  static Future<List<Garage>> garagesGet() async {
    final response = await BaseClient.get(api: EndPoints.garages);
    List<dynamic> dataList = response['data'];
    List<Garage> govsList =
        dataList.map((json) => Garage.fromJson(json)).toList();
    return govsList;
  }
}