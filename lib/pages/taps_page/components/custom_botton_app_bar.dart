import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.selectedPageIndex,
    required this.selectedPage,
  });
  final int selectedPageIndex;
  final void Function(int)? selectedPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: BottomNavigationBar(
          key: ValueKey<int>(selectedPageIndex),
          elevation: 0,
          showSelectedLabels: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: selectedPage,
          items: <BottomNavigationBarItem>[
            customBottomAppBarItem(
            context: context,
            label: 'الرئيسية',
            
            icon: Assets.assetsIconsHouse),
            customBottomAppBarItem(
              icon: Assets.assetsIconsCard,
              label: 'البطاقة',
              context: context,
            ),
            customBottomAppBarItem(
              icon:Assets.assetsIconsRouting,
              label: 'الخط',
              context: context,
            ),
            customBottomAppBarItem(
              icon: Assets.assetsIconsDriving,
              label: 'المركبات',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem customBottomAppBarItem({
    required String icon,
    required label,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
          activeIcon: Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 5,
                    color: Theme.of(context).colorScheme.primaryFixed),
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(icon,
                  color: Colors.white)),
          icon: SvgPicture.asset(icon,color: Theme.of(context).hintColor.withAlpha(100),),
          label: label,
        );
  }
}
