import 'package:flutter/material.dart';
import '../../../components/custom_list_tile.dart';
import '../../../config/constant.dart';

class MoneyTransfers extends StatelessWidget {
  const MoneyTransfers({
    super.key,
    required this.moneyTransfersList,
  });
  final List moneyTransfersList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => moneyTransfersList[index],
          separatorBuilder: (context, index) => Gap(Insets.small),
          itemCount: moneyTransfersList.length),
    );
  }
}
