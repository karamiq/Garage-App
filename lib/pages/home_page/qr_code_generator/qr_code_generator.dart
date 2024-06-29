import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../components/custom_app_bar.dart';

class QrCodeGEneratorPage extends StatelessWidget {
  const QrCodeGEneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Center(
        heightFactor: .9,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.medium, vertical: Insets.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        data: 'https://www.youtube.com/watch?v=vdRCbg2FQ2M',
                        version: QrVersions.auto,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(Insets.medium),
              Text(
                'قم بأعطاء الكود عند البوابة للخروج من الكراج',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
