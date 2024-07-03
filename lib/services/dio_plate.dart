import 'package:Trip/model/MobileUtils/plate_characters.dart';

import '../client/base_client.dart';
import '../model/MobileUtils/plate_types.dart';

class PlateTypeService {
  static Future<List<PlateType>> plateTypeGet() async {
    final response = await BaseClient.get(api: EndPoints.plateTypes);
    List<dynamic> dataList = response['data'];
    List<PlateType> govsList =
        dataList.map((json) => PlateType.fromJson(json)).toList();
    return govsList;
  }
}

class PlateCharactersService {
  static Future<List<PlateCharacter>> plateCharacterGet() async {
    final response = await BaseClient.get(api: EndPoints.plateCharacter);
    List<dynamic> dataList = response['data'];
    List<PlateCharacter> govsList =
        dataList.map((json) => PlateCharacter.fromJson(json)).toList();
    return govsList;
  }

  static Future<List<PlateCharacter>> plateCharacterGetByGovId(
      String govId) async {
    final response = await BaseClient.get(api: EndPoints.plateCharacter);
    List<dynamic> dataList = response['data'];
    List<PlateCharacter> govsList =
        dataList.map((json) => PlateCharacter.fromJson(json)).toList();
    List<PlateCharacter> filteredGovsList =
        govsList.where((plate) => plate.governorateId == govId).toList();

    return filteredGovsList;
  }
}
