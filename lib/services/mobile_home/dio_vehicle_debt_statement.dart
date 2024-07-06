import 'package:Trip/model/MobileHomes/vehicle_debt_statement.dart';
import '../../client/base_client.dart';

class VehicleDebtStatementService {
  static Future<VehicleDebtStatement?> vehicleDebtStatementGet(
      String vehicleId) async {
    
      final response = await BaseClient.get(
          api: EndPoints.vehicleDebtStatement,
          queryParameters: {
            'vehicleId': vehicleId,
          });
      dynamic dataList = response;
      VehicleDebtStatement home = VehicleDebtStatement.fromJson(dataList);
      return home;
  }
}