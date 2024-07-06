import 'package:Trip/model/MobileHomes/last_trips.dart';
import '../../client/base_client.dart';

class lastTripsService {
  static Future<LastTrips?> lastTripsGet(String vehicleId) async {
    final response =
        await BaseClient.get(api: EndPoints.lastTrips, queryParameters: {
      'vehicleId': vehicleId,
    });
    dynamic dataList = response;
    LastTrips home = LastTrips.fromJson(dataList);
    return home;
  }
}
