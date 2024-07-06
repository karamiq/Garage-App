import 'package:Trip/model/MobileHomes/smart_card_transaction_log.dart';
import '../../client/base_client.dart';

class lastTripsService {
  static Future<SmartCardTransactionLog?> lastTripsGet(
      String smartCardId) async {
    final response = await BaseClient.get(
        api: EndPoints.smartCardTransactionLogs,
        queryParameters: {
          'smartCardId': smartCardId,
        });
    dynamic dataList = response;
    SmartCardTransactionLog home = SmartCardTransactionLog.fromJson(dataList);
    return home;
  }
}
