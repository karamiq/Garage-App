import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar(
      {super.key,
      required this.selectedPageIndex,
      required this.selectedPage,
      required this.size});
  final int selectedPageIndex;
  final void Function(int)? selectedPage;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.all(0),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        //selectedFontSize: CoustomIconTheme.smallize,
        //unselectedFontSize: CoustomIconTheme.smallize,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(Assets.assetsIconsHouse,color: Colors.white),
            icon: SvgPicture.asset(Assets.assetsIconsHouse),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsCard),
            label: 'البطاقة',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsRouting),
            label: 'الخط',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsDriving),
            label: 'المركبات',
          ),
        ],
      ),
    );
  }
}
