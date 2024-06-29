import 'package:flutter/material.dart';
import '../../../components/custom_list_tile.dart';
import '../../../config/constant.dart';

class MoneyTransfers extends StatelessWidget {
  const MoneyTransfers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var title = 'تم شحن البطاقة';
    var subtitle = '2023/2/24';
    var trailing = '25,000 د. ع.';
    var icon = Assets.assetsIconsRouting;
    return Container(
      height: 300,
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CustomListTile(
              icon: icon,
              title: title,
              subtitle: subtitle,
              trailing2: trailing),
          separatorBuilder: (context, index) => Gap(Insets.small),
          itemCount: 7),
    );
  }
}
