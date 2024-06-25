import 'dart:io';

import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({required this.onPickImage, super.key, required this.text});
  final String text;
  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  void _takePicture() async {
    try {
      final imagePicker = ImagePicker();
      dynamic pickedImage = await imagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 600);
      setState(() => _selectedImage = File(pickedImage.path));
      widget.onPickImage(_selectedImage!);
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: _takePicture,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis),
            color:
                Theme.of(context).colorScheme.primaryContainer.withAlpha(100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsIconsUploadSimple,
              color: Theme.of(context).colorScheme.primary,
              width: 40,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Gap(Insets.small),
            Text(
              'تصفح',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Gap(Insets.exSmall),
            Container(
              height: 1.5,
              width: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
    if (_selectedImage != null) {
      content = GestureDetector(
          onTap: _takePicture,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius:
                BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis),
            child: Image.file(
              _selectedImage!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ));
    }
    return Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis),
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.primary)),
        height: 200,
        width: double.infinity,
        alignment: Alignment.center,
        child: content);
  }
}
