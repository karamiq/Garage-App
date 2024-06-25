import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOwnerController extends GetxController {
  // Page one holder or owner info
  TextEditingController fullName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController issuer = TextEditingController();
  TextEditingController issuerDate = TextEditingController();
  File? drivingLicensePicture;

  // Page two car info
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

  // Page Three holder or owner personal picture
  File? personalPicture;

  // Page Four holder or owner qrCode
  File? qrCode;

  // Page Five: just for holder account
  TextEditingController holderStateWork = TextEditingController();
  TextEditingController holderGarageWork = TextEditingController();

  void printValues() {
    // Page one values
    print('//////////////////////////////////////////////');
    print('Full Name: ${fullName.text}');
    print('Mother Name: ${motherName.text}');
    print('State: ${state.text}');
    print('Area: ${area.text}');
    print('ID Number: ${idNumber.text}');
    print('Issuer: ${issuer.text}');
    print('Issuer Date: ${issuerDate.text}');
    print('Driving License Picture Path: ${drivingLicensePicture?.path}');
    print('*********************************************');
    // Page two values
    print('Car Plate Number: ${carPlateNumber.text}');
    print('Car Number Letter: ${carPlateLetter.text}');
    print('Car State: ${carState.text}');
    print('Car Plate Type: ${carPlateType.text}');
    print('Car Shasy Number: ${carShasyNumber.text}');
    print('Car Type: ${carType.text}');
    print('Car Model: ${carModel.text}');
    print('Car Color: ${carColor.text}');
    print('Car Number Of Seats: ${carNumberOfSeats.text}');
    print('Car License Picture Path: ${carLicensePicture?.path}');
    print('Car Picture Path: ${carPicture?.path}');
    print('Car Year: ${carYear.text}');   
    print('*********************************************');
    // Page three values
    print('Personal Picture Path: ${personalPicture?.path}');
    print('*********************************************');
    // Page four values
    print('QR Code Path: ${qrCode?.path}');
    print('*********************************************');
    // Page five values
    print('Holder State Work: ${holderStateWork.text}');
    print('Holder Garage Work: ${holderGarageWork.text}');
    print('//////////////////////////////////////////////');
  }
}
