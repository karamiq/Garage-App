import 'package:Trip/model/DriverAppViolations/vehicle_violations.dart';
import 'package:flutter/material.dart';

import '../../../../components/under_lined_text_button.dart';
import '../../../../config/constant.dart';
import '../../../../router/router.dart';

class FeeDetailesHead extends StatelessWidget {
  const FeeDetailesHead({
    super.key,
    required this.debtStatementReceipt,
  });

  final Violation debtStatementReceipt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'غرامة ${debtStatementReceipt.number}#',
              style: TextStyle(
                fontSize: CustomFontsTheme.bigSize,
              ),
            ),
            Gap(Insets.exSmall),
            Text(
              makeDate(debtStatementReceipt.creationDate),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        UnderLinedTextBUtton(
          text: 'تقديم شكوى',
          onTap: () => Get.toNamed(
              Routes.feesOnCarPage + Routes.sendingComplainPage,
              arguments: {
                'isFromProfile': false,
                'debtStatementReceipt': debtStatementReceipt,
              }),
        )
      ],
    );
  }
}
