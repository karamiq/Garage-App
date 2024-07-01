import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import 'package:Trip/components/viewed_item_title.dart';
import 'package:Trip/router/router.dart';

import '../../../config/constant.dart';
import '../../home_page/components/home_page_head.dart';

class CardPageContents extends StatelessWidget {
  const CardPageContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageHead(
          imageUrl: Assets.assetsImagesAvatarImage,
        ),
        Gap(Insets.medium),
        UserCard(
          qrData: 'https://github.com/karamiq/Garage-App',
          carPlateInfo: '24214 أ / بغداد',
          carType: 'دوج جارجر',
          expireDate: ' 10/12/2025',
          cardNumber: '10023',
          cardMoney: 125000,
          buttonAppears: false,
        ),
        Gap(Insets.exLarge),
        ViewedItemsTitle(
            mainText: 'أخر التحويلات المالية',
            secontText: 'رؤية الجميع',
            onTap: () => Get.toNamed(
                  Routes.seeAllPage,
                )),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: Insets.medium),
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CustomListTile(
              icon: Assets.assetsIconsCard,
              title: 'تم شحن البطاقة',
              subtitle: '2023/2/24',
              trailing2: '25,000 د. ع.'),
          separatorBuilder: (context, index) => Gap(Insets.small),
        ),
      ],
    );
  }
}
