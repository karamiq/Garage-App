import 'package:Trip/client/base_client.dart';
import 'package:Trip/model/DriverAppViolations/vehicle_violations.dart';

class VehicleViolationService {
  static Future<VehicleViolations> vehicleViolationById(
      String violationId) async {
    final response =
        await BaseClient.get(api: EndPoints.governorate + violationId);
    List<dynamic> dataList = response['data'];
    List<VehicleViolations> govsList =
        dataList.map((json) => VehicleViolations.fromJson(json)).toList();
    VehicleViolations violation = govsList.firstWhere(
        (violation) => violation == violationId,
        orElse: () => throw Exception());
    return violation;
  }

  static Future<VehicleViolations> vehicleViolations(String vehicleId) async {
    final response = await BaseClient.get(
        api: EndPoints.vehicleViolations,
        queryParameters: {'vehicleId': vehicleId});
    VehicleViolations govsList = VehicleViolations.fromJson(response);
    return govsList;
  }
}
