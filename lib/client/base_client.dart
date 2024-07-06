import 'dart:io';

import 'package:Trip/config/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class BaseClient {
  static DioHttp get dioHttp => Get.find<DioHttp>();

  static Future<dynamic> get({
    required String api,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic> response =
          await dioHttp.dio.get(api, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Logger().e("Error in GET request: $e");
      return false;
    }
  }

  static Future<Tuple2<bool, dynamic>> post({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response<dynamic> response = await dioHttp.dio
          .post(api, queryParameters: queryParameters, data: data);
      return Tuple2(true, response.data);
    } catch (e) {
      Logger().e("Error in POST request: $e");
      return const Tuple2(false, null);
    }
  }

  static Future<Tuple2<bool, dynamic>> postFormData({
    required String api,
    Map<String, dynamic>? queryParameters,
    FormData? data,
  }) async {
    try {
      Response<dynamic> response = await dioHttp.dio.post(
        api,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          // contentType: "multipart/form-data",

          receiveTimeout: const Duration(days: 21),
          sendTimeout: const Duration(days: 21),
        ),
      );
      return Tuple2(true, response.data);
    } catch (e) {
      Logger().e("Error in POST (FormData) request:");
      Logger().e(e);
      return const Tuple2(false, null);
    }
  }

  static Future<bool> put({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      await dioHttp.dio.put(api, queryParameters: queryParameters, data: data);
      return true;
    } catch (e) {
      Logger().e("Error in PUT request: $e");
      return false;
    }
  }

  static Future<bool> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await dioHttp.dio.delete(api, queryParameters: queryParameters);
      return true;
    } catch (e) {
      Logger().e("Error in DELETE request: $e");
      return false;
    }
  }

  //Wasn't here before
  static Future<Tuple2<bool, dynamic>> postFile({
    required String api,
    required File file,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      Response<dynamic> response = await dioHttp.dio.post(
        api,
        data: formData,
        queryParameters: queryParameters,
        options: Options(
          contentType: 'multipart/form-data',
          // You can adjust timeout options as needed
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      );

      return Tuple2(true, response.data);
    } catch (e) {
      Logger().e("Error in POST (File) request:");
      Logger().e(e);
      return const Tuple2(false, null);
    }
  }
}

class EndPoints {
  //Mobile Homes
  static const home = '/mobile/home/';
  static const lastTrips = '/mobile/last-trip/';
  static const smartCardTransactionLogs = '/mobile/smart-card-transaction-logs/';
  static const vehicleDebtStatement = '/mobile/vehicle-debt-statement/';
  static const tripScreen = '/mobile/trip-screen/';
  static const vehiclePathLocation = '/mobile/vehicle-path-locations/';
  static const driverCardTransaction = '/mobile/dricer-card-transation';
  //file
  static const file = '/file';
  static const files = 'file/multi';
  //Mobile utils
  static const governorate = '/mobile/governorates';
  static const city = '/mobile/cities';
  static const plateCharacter = '/mobile/plate-characters';
  static const plateTypes = '/mobile/plate-types';
  static const vehicleModel = '/mobile/vehicle-models';
  static const vehiclTypes = '/mobile/vehicle-types';
  static const pathTypes = '/mobile/path-types';
  static const garages = '/mobile/garages';
  static const paths = '/mobile/paths';
  //Profiles
  static const profiles = '/profiles';
  static const login = '/login';
  static const register = 'profiles/register';
  static const verifyOtp = '/profiles/verify-otp';
  static const sendOtp = '/profiles/send-otp';
  static const notifications = '/profiles/notifications';
  static const getDriverVehcile = '/profiles/get-driver-vehicles';
}
