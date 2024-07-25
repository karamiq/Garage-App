import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/veichles_page/components/holder_info_row.dart';
import 'package:Trip/services/dio_govs&cities.dart';
import 'package:flutter/material.dart';

class AllAvailableDriversPage extends StatefulWidget {
  const AllAvailableDriversPage({super.key});

  @override
  State<AllAvailableDriversPage> createState() =>
      _AllAvailableDriversPageState();
}

class _AllAvailableDriversPageState extends State<AllAvailableDriversPage> {
  final garageController = TextEditingController();
  final stateController = TextEditingController();

  List driversList = [];
  List filteredDrivers = [];
  String searchQuery = '';

  void filterCars(String query) {
    print('Cars filtering: $query');
    if (mounted) {
      setState(() {
        searchQuery = query;
        filteredDrivers = driversList
            .where(
                (car) => car.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'جميع الحائزين المتوفرين',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Insets.medium),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomApiItemSelect(
                      labelText: 'المحافظة',
                      controller: garageController,
                      itemListFuture: GovsService.gov(),
                      validator: null),
                ),
                Gap(Insets.small),
                Expanded(
                  child: CustomApiItemSelect(
                      labelText: 'الكراج',
                      controller: stateController,
                      itemListFuture: GovsService.gov(),
                      validator: null),
                ),
              ],
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //The filtered list must be applied here when linking with api
                itemBuilder: (context, index) => HolderInfoRow(
                    name: 'محمد علي',
                    id: '93745',
                    phoneNumber: 'أ ',
                    photoUrl: Assets.assetsImagesAvatarImage,
                    state: 'صلاح الدين'),
                separatorBuilder: (context, index) => Gap(Insets.small),
                itemCount: 11)
          ],
        ),
      ),
    );
  }
}
