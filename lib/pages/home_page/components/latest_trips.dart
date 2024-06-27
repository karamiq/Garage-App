import 'package:flutter/material.dart';
import '../../../config/constant.dart';

class LatestTrips extends StatelessWidget {
  const LatestTrips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: 7,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Gap(Insets.small),
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.1,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.small - 5, vertical: Insets.small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
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
                    Gap(Insets.small),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('من',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),),
                        Text('كراج العلاوي '),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 40.0,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('الى',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),), Text('كراج ام قصر')],
                    ),
                    Gap(Insets.medium),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('السعر الكلي',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),), Text('6,500 د. ع.')],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      iconSize: Insets.large,
                    ),
                  ],
                ),
              ],
            )),
      ),
    ));
  }
}