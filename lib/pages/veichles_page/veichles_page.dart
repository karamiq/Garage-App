import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/pages/veichles_page/components/veichles_page_content.dart';
import 'package:Trip/pages/veichles_page/components/viechle_page_shimmer.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../components/viewed_item_title.dart';
import 'components/holder_info_row.dart';
import 'components/viechle_info_row.dart';

class VeichlesPage extends StatelessWidget {
  const VeichlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: Column(
          children: [
            ViechlePageShimmer(),
            //VeichlesPageContent(),
          ],
        ),
      ),
    );
  }
}
