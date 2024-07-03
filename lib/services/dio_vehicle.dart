import 'package:Trip/model/MobileUtils/vehicle_model.dart';
import 'package:Trip/model/MobileUtils/vehicle_type.dart';

import '../client/base_client.dart';

class VehicleService {
  static Future<VehicleModel> vehicleModelGetByName(String govName) async {
    final response = await BaseClient.get(api: EndPoints.vehicleModel);
    List<dynamic> dataList = response['data'];
    List<VehicleModel> govsList =
        dataList.map((json) => VehicleModel.fromJson(json)).toList();
    VehicleModel govs = govsList.firstWhere((gov) => gov.name == govName,
        orElse: () => throw Exception());
    return govs;
  }

  static Future<List<VehicleModel>> vehicleModelGet() async {
    final response = await BaseClient.get(api: EndPoints.vehicleModel);
    List<dynamic> dataList = response['data'];
    List<VehicleModel> govsList =
        dataList.map((json) => VehicleModel.fromJson(json)).toList();
    return govsList;
  }

  ////////////////////////////////////////////////////////////////////////
  static Future<VehicleType> vehicleTypeGetByName(String govName) async {
    final response = await BaseClient.get(api: EndPoints.vehiclTypes);
    List<VehicleType> dataList = response['data'];
    List<VehicleType> govsList = dataList
        .map((json) => VehicleType.fromJson(json as Map<String, dynamic>))
        .toList();
    VehicleType govs = govsList.firstWhere((gov) => gov.name == govName,
        orElse: () => throw Exception("Vehicle type not found"));

    return govs;
  }

  static Future<List<VehicleType>> vehicleTypeGet() async {
    final response = await BaseClient.get(api: EndPoints.vehiclTypes);
    List<dynamic> dataList = response['data'];
    List<VehicleType> govsList =
        dataList.map((json) => VehicleType.fromJson(json)).toList();
    return govsList;
  }
}
