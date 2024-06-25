import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class KeepGoingPage extends StatelessWidget {
  const KeepGoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(Insets.exLarge),
              SvgPicture.asset(Assets.assetsIconsCheckCircleFilled,height: 250,color: Theme.of(context).colorScheme.primary,)
             ,Gap(Insets.exLarge),
             Column(
              children: [
                Text('تهانينا',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: CustomFontsTheme.veryBigSize*1.5
                  ),
                ),
                Gap(Insets.exSmall),
                Text('تم انشاء الحساب بنجاح',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: CustomFontsTheme.mediumSize*1.5
                  ),
                )
              ],
             ),

            ElevatedButton(
                onPressed: (){},
                child:Text('استمرار'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
