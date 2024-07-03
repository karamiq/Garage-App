import 'dart:io';
import 'package:dio/dio.dart';
import '../client/base_client.dart';

class FileService {
  static Future<String> multipleFiles({required File image}) async {
    print('the image at the post api: $image');
    FormData formData = FormData();
    String fileName = image.path.split('/').last;
    formData.files.add(MapEntry(
      'file',
      await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
    ));

    final response = await BaseClient.postFormData(
      api: EndPoints.file,
      data: formData,
    );
    String urls = 'https://garagat-api.digital-logic.tech/' + response.item2;
    return urls;
  }
}
