import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

import '../card_page/card_page.dart';
import '../home_page/home_page.dart';
import '../path_page/path_page.dart';
import '../veichles_page/veichles_page.dart';
import 'components/custom_botton_app_bar.dart';

class TapsPage extends StatefulWidget {
  const TapsPage({super.key});

  @override
  State<TapsPage> createState() => _TapsPageState();
}

class _TapsPageState extends State<TapsPage> {
   int pageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      // selectedPageIndex = index;
      pageIndex = index;
    });
  }
    @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const CardPage(),
      const PathPage(),
      const VeichlesPage(),
    ];
  }
  // int selectedPageIndex = 0;
  double slideSize = 0;
  List<Widget> _pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: FloatingActionButton(
      //  shape: const CircleBorder(),
      //  elevation: 0,
      //  onPressed: () {},
      //  mini: true,
      //  child: Container(
      //    alignment: Alignment.center,
      //    decoration: BoxDecoration(
      //        color: const Color(0xFFC9DEE5),
      //        borderRadius: BorderRadius.circular(50)),
      //    child: const Icon(
      //      Icons.add_circle_outline_rounded,
      //      color: CustomColorsTheme.headLineColor,
      //      size: 40,
      //    ),
      //  ),
      //),
      bottomNavigationBar:CustomBottomAppBar(
        selectedPage: _selectedPage,
        selectedPageIndex: pageIndex,
      ),
      body: _pages[pageIndex],
    );
  }
}