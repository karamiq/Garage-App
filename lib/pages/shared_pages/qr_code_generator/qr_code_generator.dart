import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../components/custom_app_bar.dart';

class QrCodeGEneratorPage extends StatelessWidget {
  const QrCodeGEneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final text = data['text'];
    final qrData = data['qrData'];
    final newCar = data['newCar'];
    var title;
    return Scaffold(
      appBar: newCar ? null : CustomAppBar(title: title),
      body: Center(
        heightFactor: .9,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.medium, vertical: Insets.large),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius * 3),
                      ),
                      child: Center(
                        child: Container(
                          width: 265,
                          height: 265,
                          padding: EdgeInsets.all(Insets.exSmall),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  CustomBorderTheme.normalBorderRadius * 2)),
                          child: Center(
                            child: QrImageView(
                              dataModuleStyle: QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.circle),
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              data: qrData,
                              version: QrVersions.auto,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(Insets.medium),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: CustomFontsTheme.veryBigSize,
                      ),
                    ),
                  ],
                ),
              ),
              if (newCar)
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.tapsPage),
                      child: ElevatedButtonChild(
                          text: 'أضافة بالدفع الألكتروني',
                          icon: Assets.assetsIconsCard)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
