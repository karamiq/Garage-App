import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/model/Profiles/register.dart';
import 'package:Trip/services/dio_files.dart';

class CreateOwnerController extends GetxController {
  bool isLoading = false;
  bool? isOwner;

  // Page one
  TextEditingController fullName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController governorate = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController issuer = TextEditingController();
  TextEditingController issuerDate = TextEditingController();
  TextEditingController drivingLicenseNumber = TextEditingController();
  File? drivingLicensePicture;

  // Page two
  TextEditingController carPlateNumber = TextEditingController();
  TextEditingController carPlateLetter = TextEditingController();
  TextEditingController carState = TextEditingController();
  TextEditingController carPlateType = TextEditingController();
  TextEditingController carShasyNumber = TextEditingController();
  TextEditingController carType = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carColor = TextEditingController();
  TextEditingController carNumberOfSeats = TextEditingController();
  File? carLicensePicture;
  File? carPicture;
  TextEditingController carYear = TextEditingController();

  // Page three
  File? personalPicture;
  File? qrCode;

  // Page four
  TextEditingController holderStateWork = TextEditingController();
  TextEditingController holderGarageWork = TextEditingController();

  // Other variables
  TextEditingController plateCharacterId = TextEditingController();
  TextEditingController userGovernorateId = TextEditingController();
  TextEditingController carGovernorateId = TextEditingController();
  TextEditingController plateTypeId = TextEditingController();
  TextEditingController vehicleTypeId = TextEditingController();
  TextEditingController vehicleModelId = TextEditingController();

  String? vehicleImageUrl;
  String? vehicleLicenseImageUrl;

  late PostVehicle vehicle;

  @override
  void onInit() {
    super.onInit();
    vehicle = PostVehicle(
      plateNumber: carPlateNumber.text,
      plateCharacterId: plateCharacterId.text,
      governorateId: carGovernorateId.text,
      plateTypeId: plateTypeId.text,
      chassisNumber: carShasyNumber.text,
      vehicleTypeId: vehicleTypeId.text,
      vehicleModelId: vehicleModelId.text,
      manufacturingYear: int.tryParse(carYear.text) ?? 0,
      color: carColor.text,
      numberOfSeats: int.tryParse(carNumberOfSeats.text) ?? 0,
      vehicleLicense: null,
      vehicleLicenseImages: [vehicleLicenseImageUrl!],
      vehicleImages: [vehicleImageUrl!],
      note: null,
    );
  }

  Future<void> addVehicle() async {
    if (isOwner != null && isOwner!) {
      vehicleImageUrl = await FileService.multipleFiles(image: carPicture!);
      vehicleLicenseImageUrl =
          await FileService.multipleFiles(image: carLicensePicture!);
    }
    try {
      await BaseClient.post(api: EndPoints.addVehicle, data: vehicle.toJson());
    } catch (e) {
      print('Error adding vehicle: $e');
      // Handle error with UI feedback
    }
  }

  Future<void> register() async {
    isLoading = true;
    vehicleImageUrl = await FileService.multipleFiles(image: carPicture!);
    vehicleLicenseImageUrl =
        await FileService.multipleFiles(image: carLicensePicture!);
    try {
      final response = await BaseClient.post(api: EndPoints.register, data: {
        'driverType': isOwner! ? 0 : 1,
        'fullName': fullName.text,
        'motherName': motherName.text,
        'governorateId': userGovernorateId.text,
        'address': area.text,
        'identityNumber': int.tryParse(idNumber.text) ?? 0,
        'issuer': issuer.text,
        'registrationDate': DateTime.parse(issuerDate.text).toIso8601String(),
        'driverLicense': drivingLicenseNumber.text,
        'driverLicenseImages': [
          await FileService.multipleFiles(image: drivingLicensePicture!)
        ],
        'image': await FileService.multipleFiles(image: personalPicture!),
        'vehicle': isOwner! ? vehicle.toJson() : null,
      });
      print('Registration response: $response');
    } catch (e) {
      print('Exception during registration: $e');
      // Handle error with UI feedback
    }
    isLoading = false;
  }

  void printVariables() {
    print('= Page one holder or owner info =');
    print('Full Name: ${fullName.text}');
    print('Mother Name: ${motherName.text}');
    print('Governorate: ${governorate.text}');
    print('Area: ${area.text}');
    print('ID Number: ${idNumber.text}');
    print('Issuer: ${issuer.text}');
    print('Issuer Date: ${(issuerDate.text)}');
    print('Driving License Picture: $drivingLicensePicture');
    print('Driving License Number: $drivingLicenseNumber');
    print('===============================================');

    print('= Page two car info =');
    print('Car Plate Number: ${carPlateNumber.text}');
    print('Car Plate Letter: ${carPlateLetter.text}');
    print('Car State: ${carState.text}');
    print('Car Plate Type: ${carPlateType.text}');
    print('Car Shasy Number: ${carShasyNumber.text}');
    print('Car Type: ${carType.text}');
    print('Car Model: ${carModel.text}');
    print('Car Color: ${carColor.text}');
    print('Car Number Of Seats: ${carNumberOfSeats.text}');
    print('Car License Picture: $carLicensePicture');
    print('Car Picture: $carPicture');
    print('Car Year: ${carYear.text}');
    print('===============================================');

    print('= Page Three holder or owner personal picture =');
    print('Personal Picture: $personalPicture');
    print('===============================================');

    print('= Page Four holder or owner qrCode =');
    print('QR Code: $qrCode');
    print('===============================================');

    print('= Page Five: just for holder account =');
    print('Holder State Work: ${holderStateWork.text}');
    print('Holder Garage Work: ${holderGarageWork.text}');
    print('===============================================');

    print('= Final Variables for registration =');
    print('Plate Character ID: ${plateCharacterId.text}');
    print('User Governorate ID: ${userGovernorateId.text}');
    print('Car Governorate ID: ${carGovernorateId.text}');
    print('Plate Type ID: ${plateTypeId.text}');
    print('Vehicle Type ID: ${vehicleTypeId.text}');
    print('Vehicle Model ID: ${vehicleModelId.text}');
    print('===============================================');
  }
}
