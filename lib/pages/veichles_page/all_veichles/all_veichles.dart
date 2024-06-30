import 'package:Trip/components/custom_text_form_field.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/fees_on_car/components/car_fees_info_card.dart';
import 'package:Trip/pages/veichles_page/components/viechle_info_row.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';

class AllVeichlesPage extends StatefulWidget {
  const AllVeichlesPage({super.key});

  @override
  State<AllVeichlesPage> createState() => _AllVeichlesPageState();
}

class _AllVeichlesPageState extends State<AllVeichlesPage> {
  final SearchController = TextEditingController();

  List carsList = [];
  List filteredCars = [];
  final TextEditingController textFiledController = TextEditingController();
  String searchQuery = '';

  void filterCars(String query) {
    print('Cars filtering: $query');
    if (mounted) {
      setState(() {
        searchQuery = query;
        filteredCars = carsList
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
        title: 'جميع المركبات',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Insets.medium),
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: filterCars,
              controller: SearchController,
              labelText: 'أبحث عن أسم  سيارة',
              prefixIcon: Assets.assetsIconsMagnifyingGlass,
              validator: null,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //The filtered list must be applied here when linking with api
                itemBuilder: (context, index) => VehiclesInfoRow(
                    carType: 'كورلا',
                    carPlateNumber: '93745',
                    carLetter: 'أ ',
                    carState: 'بغداد'),
                separatorBuilder: (context, index) => Gap(Insets.small),
                itemCount: 11)
          ],
        ),
      ),
    );
  }
}
