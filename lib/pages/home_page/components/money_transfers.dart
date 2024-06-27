import 'package:flutter/material.dart';
import '../../../config/constant.dart';

class MoneyTransfers extends StatelessWidget {
  const MoneyTransfers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          elevation: .1,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListTile(
          leading: Container(
                        padding: EdgeInsets.all(Insets.small),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              CoustomBorderTheme.normalBorderRaduis),
                          color: Theme.of(context)
                              .colorScheme
                              .onInverseSurface,
                        ),
                        child: SvgPicture.asset(
                          Assets.assetsIconsRouting,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
          title: Text('تم شحن البطاقة'),
          subtitle: Text('2023/2/24',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: CustomFontsTheme.smallSize,
                          ),),
                          trailing: Text('25,000 د. ع.',
                        style: TextStyle(
                          fontSize: CustomFontsTheme.normalSize,
                        ),),
        ),
      ), separatorBuilder: (context, index) => Gap(Insets.small), 
      itemCount: 7),
    );
  }
}
