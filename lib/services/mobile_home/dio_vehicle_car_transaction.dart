import 'package:Trip/model/MobileHomes/vehicle_debt_statement.dart';
import '../../client/base_client.dart';

class DriverCardTransactionService {
  static Future<VehicleDebtStatement?> cardTransactionGet(
      String vehicleId) async {
    final response = await BaseClient.get(
        api: EndPoints.driverCardTransaction,
        queryParameters: {
          'vehicleId': vehicleId,
        });
    dynamic dataList = response;
    VehicleDebtStatement home = VehicleDebtStatement.fromJson(dataList);
    return home;
  }
}
