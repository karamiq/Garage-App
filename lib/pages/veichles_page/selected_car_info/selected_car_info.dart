import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/pages/veichles_page/selected_car_info/components/selected_car_info_content.dart';
import 'package:Trip/pages/veichles_page/selected_car_info/components/selected_car_info_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_list_tile.dart';
import '../../../components/mini_card.dart';
import '../../../components/trip_card.dart';
import '../../../config/constant.dart';
import '../../../router/router.dart';
import '../../home_page/components/container_stack_decoration.dart';
import '../../home_page/components/home_page_bottom_falf.dart';
import '../../home_page/components/user_card.dart';
import 'components/selected_car_info_head.dart';

class SelectedCarInfoPage extends StatelessWidget {
  const SelectedCarInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.medium),
          child: Column(
            children: [
              SelectedCarInfoShimmer()
              //SelectedCarInfoContent(),
            ],
          ),
        ));
  }
}
