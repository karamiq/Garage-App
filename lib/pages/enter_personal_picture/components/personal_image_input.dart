import 'dart:io';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalImageInput extends StatefulWidget {
  const PersonalImageInput({required this.onPickImage, super.key});
  final void Function(File image) onPickImage;

  @override
  State<PersonalImageInput> createState() => _PersonalImageInputState();
}

class _PersonalImageInputState extends State<PersonalImageInput> {
  File? _selectedImage;
  dynamic takePicture(ImageSource source) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
        source: source,
        maxWidth: 600,
      );
      if (pickedImage == null) {
        return;
      }
      setState(() => _selectedImage = File(pickedImage.path));
      widget.onPickImage(_selectedImage!);
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.assetsIconsImage,
          height: 100,
          color: Theme.of(context).hintColor.withAlpha(100),
        ),
      ),
    );

    if (_selectedImage != null) {
      content = ClipOval(
        clipBehavior: Clip.hardEdge,
        child: Image.file(
          _selectedImage!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return Column(
      children: [
        Container(
          height: 270,
          width: 270,
          padding: EdgeInsets.all(Insets.small / 1.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFb77134),
                Color(0xFFffae48),
                Color(0xFFffae48),
                Color(0xFFffae48),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.all(Insets.small),
            child: content,
          ),
        ),
        Gap(Insets.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () async=>await takePicture(ImageSource.camera),
                icon: Padding(
                  padding: EdgeInsets.all(Insets.exSmall/2),
                  child: SvgPicture.asset(
                    Assets.assetsIconsCamera,
                    color: Colors.white,
                  ),
                )),
            Gap(Insets.small),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 50)
              ),
              onPressed:() async=>await takePicture(ImageSource.gallery),
              child: Text(
                'أختر من المعرض',
                style: TextStyle(
                  fontSize: CustomFontsTheme.mediumSize,
                  color: Theme.of(context).hintColor.withAlpha(100),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
