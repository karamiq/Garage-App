import 'dart:io';

import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    required this.onPickImage,
    super.key,
    required this.text,
  });
  final String text;
  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        File pickedFile = File(result.files.single.path!);
        setState(() => _selectedImage = pickedFile);
        widget.onPickImage(_selectedImage!);
      } else {
        // User canceled the picker
        return;
      }
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
          borderRadius: BorderRadius.circular(
            CustomBorderTheme.normalBorderRadius,
          ),
          color: Theme.of(context).colorScheme.primaryContainer.withAlpha(100),
        ),
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
            SizedBox(height: Insets.small),
            Text(
              'تصفح',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: Insets.exSmall),
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
          borderRadius: BorderRadius.circular(
            CustomBorderTheme.normalBorderRadius,
          ),
          child: Image.file(
            _selectedImage!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          CustomBorderTheme.normalBorderRadius,
        ),
        border: DashedBorder.symmetric(
          dashLength: 10,
          strokeCap: StrokeCap.butt,
          horizontal: BorderSide(
            color: context.theme.colorScheme.primary,
            width: CustomBorderTheme.borderWidth,
          ),
          vertical:
              BorderSide(color: context.theme.colorScheme.primary, width: 1.4),
        ),
      ),
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
