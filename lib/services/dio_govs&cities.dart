import 'package:Trip/client/base_client.dart';
import 'package:Trip/model/MobileUtils/cities_and_governorate.dart';

class GovsService {
  static Future<Governorate> govGetById(String govId) async {
    final response = await BaseClient.get(api: EndPoints.governorate);
    List<dynamic> dataList = response['data'];
    List<Governorate> govsList =
        dataList.map((json) => Governorate.fromJson(json)).toList();
    Governorate govs = govsList.firstWhere((gov) => gov.id == govId,
        orElse: () => throw Exception());
    return govs;
  }

  static Future<List<Governorate>> gov() async {
    final response = await BaseClient.get(api: EndPoints.governorate);
    List<dynamic> dataList = response['data'];
    List<Governorate> govsList =
        dataList.map((json) => Governorate.fromJson(json)).toList();

    return govsList;
  }
}

class CitieServices {
  static Future<City> cityGet(String cityName) async {
    final response = await BaseClient.get(api: EndPoints.city);
    List<dynamic> dataList = response.data['data'];
    List<City> govsList = dataList.map((json) => City.fromJson(json)).toList();
    City city = govsList.firstWhere((gov) => gov.name == cityName,
        orElse: () => throw Exception());
    return city;
  }

  static Future<List<City>> govCities() async {
    final response = await BaseClient.get(api: EndPoints.governorate);
    List<City> dataList = response['data'];
    return dataList;
  }
}
