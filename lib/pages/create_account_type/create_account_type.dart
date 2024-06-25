import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../components/custom_back_botton.dart';
import 'components/account_type_card.dart';



class CreateAccountTypePage extends StatefulWidget {
  const CreateAccountTypePage({super.key});

  @override
  State<CreateAccountTypePage> createState() => _CreateAccountTypePageState();
}

class _CreateAccountTypePageState extends State<CreateAccountTypePage> {
  bool isOnwerType = false;
  void next() {
      Get.toNamed(Routes.enterHolderOrOwnerInfoPage, arguments: {'isOwner': isOnwerType});
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: CustomBackButton(),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.medium, vertical: Insets.large),
            child: Column(
              children: [
                Text(
                  'أختر نوع الحساب',
                  style: TextStyle(
                    fontSize: CustomFontsTheme.veryBigSize,
                  ),
                ),
                Gap(Insets.exLarge),
                AccountTypeCard(
                  value: true,
                  isOwnerType: isOnwerType,
                  title: 'مالك',
                  subTitle:
                      'لديك سيارة و ترغب ان تكون سائق او لديك سيارة و ترغب في توظيف سائق لها',
                  onChange: (value) => setState(() => isOnwerType = value),
                ),
                AccountTypeCard(
                  value: false,
                  isOwnerType: isOnwerType,
                  title: 'حائز',
                  subTitle: 'ليس لديك سيارة و لكنك ترغب ان تكون سائق',
                  onChange: (value) => setState(() => isOnwerType = value),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: next,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('التالي'),
                        Gap(Insets.small),
                        Icon(Icons.chevron_right_outlined),
                      ],
                    )),
              ],
            )));
  }
}
