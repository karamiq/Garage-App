import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class LastPage extends StatelessWidget {
  const LastPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
        child: Column(
          children: [
            SizedBox(
              height: Insets.exLarge * 1.5,
            ),
            Transform.rotate(
              angle: -0.3,
              child: Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5), // Glow color
                        spreadRadius: 80,
                        blurRadius: 100,
                        offset: Offset(0, 60), // Position of the glow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(BorderSize.large),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Color.fromARGB(0, 255, 255, 255),
                        ])),
                child: Padding(
                  padding: EdgeInsets.all(Insets.large),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: Insets.exLarge * 1.5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(155, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(BorderSize.small)),
                        height: 45,
                        width: 60,
                      ),
                      SizedBox(
                        height: Insets.small,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(155, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(BorderSize.small)),
                        height: 20,
                        width: 250,
                      ),
                      SizedBox(
                        height: Insets.small,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(155, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(BorderSize.small)),
                        height: 20,
                        width: 75,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'تابع اخر معلومات البطاقة الخاصة بك و اخر عمليات التحويل',
              style: TextStyle(
                fontSize: CustomFontsTheme.veryBigSize,
                color: Colors.white,
                fontWeight: CustomFontsTheme.bigWeight,
              ),
            ),
            SizedBox(
              height: Insets.large,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.loginOrRigisterPage);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'ابدأ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
