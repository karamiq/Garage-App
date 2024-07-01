import 'package:Trip/components/viewed_item_title.dart';
import 'package:Trip/pages/card_page/components/card_page_contents.dart';
import 'package:Trip/pages/card_page/components/card_page_skeleton.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
import '../../config/constant.dart';
import '../home_page/components/home_page_head.dart';
import '../home_page/components/user_card.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CardPageContents(),
                CardPageSkeleton()
              ],
            )));
  }
}
