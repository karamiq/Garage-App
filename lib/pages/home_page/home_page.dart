import 'package:Trip/components/shimmer_container.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/components/trip_card.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
import 'components/container_stack_decoration.dart';
import 'components/home_page_bottom_falf.dart';
import 'components/home_page_content.dart';
import 'components/home_page_head.dart';
import '../../components/mini_card.dart';
import 'components/home_page_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic uerInfo;
  Future<dynamic> fetchData() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.medium),
          child: Column(
            children: [
              if (uerInfo != null) HomePageSkeleton(),
              if (uerInfo == null) HomePageContent(),
            ],
          ),
        ));
  }
}
