
import '../../../../config/constant.dart';
import '../../../../model/MobileHomes/vehicle_debt_statement.dart';
import 'car_fees_info_card.dart';
import 'fee_card.dart';

class FeesOnCarContent extends StatelessWidget {
  const FeesOnCarContent({super.key, required this.feesList, required this.numberOfReceipt, required this.accumulatedPrice});
  final List<DebtStatementReceipt> feesList;
  final int numberOfReceipt;
  final int accumulatedPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CarFeesInfoCard(
                title: 'عدد الغرامات',
                subTitle: numberOfReceipt.toString(),
                icon: Assets.assetsIconsTrafficSignal,
                onIconPressed: () {},
              ),
            ),
            Gap(Insets.medium),
            Expanded(
              child: CarFeesInfoCard(
                title: 'مبلغ الغرامات المتراكم',
                subTitle: '$accumulatedPrice د. ع.',
                icon: Assets.assetsIconsDollarSquare,
                onIconPressed: () {},
              ),
            )
          ],
        ),
        Gap(Insets.exLarge),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: feesList.length,
          itemBuilder: (context, index) => FeeCard(
            fee: feesList[index].amount.toString(),
            isFeePaid: feesList[index].isPaid,
            debtStatementReceipt: feesList[index],
          ),
          separatorBuilder: (context, index) => Gap(Insets.small),
        )
      ],
    );
  }
}
