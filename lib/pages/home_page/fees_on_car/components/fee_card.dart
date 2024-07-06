import 'package:flutter/material.dart';

import '../../../../config/constant.dart';
import '../../../../model/DriverAppViolations/vehicle_violations.dart';
import '../../../../model/MobileHomes/vehicle_debt_statement.dart';
import '../../../../router/router.dart';

class FeeCard extends StatelessWidget {
  const FeeCard({
    super.key,
    required this.debtStatementReceipt,
  });
  final Violation debtStatementReceipt;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onSecondary,
      child: ListTile(
        onTap: () => Get.toNamed(Routes.feesOnCarPage + Routes.feeDetailesPage,
            //here is where tha id is passed
            arguments: {'debtStatementReceipt': debtStatementReceipt}),
        contentPadding: EdgeInsets.symmetric(horizontal: Insets.small),
        leading: Container(
          padding: EdgeInsets.all(Insets.small),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
          child: SvgPicture.asset(
            Assets.assetsIconsCard,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text('غرامة مالية'),
        subtitle: Text(
          '${debtStatementReceipt.amount} د. ع',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: CustomFontsTheme.smallSize,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Insets.exLarge),
                    color: debtStatementReceipt.isPaid
                        ? Color.fromARGB(255, 93, 216, 157)
                        : Theme.of(context).colorScheme.errorContainer),
                padding: EdgeInsets.all(Insets.small),
                child: Text(
                  debtStatementReceipt.isPaid ? 'مدفوعة' : ' غير مدفوعة',
                  style: TextStyle(
                      color: debtStatementReceipt.isPaid
                          ? Color.fromARGB(255, 31, 72, 33)
                          : Color.fromARGB(255, 91, 30, 30)),
                )),
            Gap(Insets.small),
            Icon(
              Icons.chevron_right_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
