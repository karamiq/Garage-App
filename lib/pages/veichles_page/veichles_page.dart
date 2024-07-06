import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/veichles_page/components/veichles_page_content.dart';
import 'package:flutter/material.dart';

import 'components/viechle_page_skeleton.dart';

class VeichlesPage extends StatelessWidget {
  const VeichlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: Column(
          children: [
            //ViechlePageSkeleton(),
            VehiclesPageContent(),
          ],
        ),
      ),
    );
  }
}
