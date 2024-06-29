import 'package:flutter/material.dart';

import '../../../../components/under_lined_text_button.dart';
import '../../../../config/constant.dart';
import '../../../../router/router.dart';

class FeeDetailesHead extends StatelessWidget {
  const FeeDetailesHead({
    super.key,
    required this.feeNumber,
    required this.feeDate,
    required this.id,
    required this.fee,
    required this.feeReason,
  });

  final String feeNumber;
  final String feeDate;
  final String id;
  final String fee;
  final String feeReason;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'غرامة $feeNumber#',
              style: TextStyle(
                fontSize: CustomFontsTheme.bigSize,
              ),
            ),
            Gap(Insets.exSmall),
            Text(
              feeDate,
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
                'id': id,
                'fee': fee,
                'feeReason': feeReason,
                'feeDate': feeDate,
                'feeNumber': feeNumber,
              }),
        )
      ],
    );
  }
}
