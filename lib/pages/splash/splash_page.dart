import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'components/last_page.dart';
import 'components/pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        allowImplicitScrolling: true,
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          SplashPageStyle(
            top: 150,
            right: -280,
            angle: 21.5,
            child: Image.asset(Assets.assetsImagesCar),
            text: 'شاهد معلومات سيارتك',
            subText: 'شاهد معلومات السائق والرحلات الماضية',
          ),
          SplashPageStyle(
            top: 220,
            right: -100,
            angle: 11,
            child: Image.asset(Assets.assetsImagesInvoicePaper),
            text: 'تتبع الغرامات المالية',
            subText: 'شاهد الغرامات المتراكمة على المركبة الخاصة بك',
          ),
          SplashPageStyle(
            top: 20,
            right: -0,
            angle: 12,
            child: Image.asset(Assets.assetsImagesBellOtification),
            text: 'تنبيهات انتهاء الصلاحية',
            subText: 'تنبيهات بأنتهاء صلاحية البطاقة وكشف الحاسبة ...الخ',
          ),
          LastPage()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _currentPage < 3
          ? Padding(
              padding: EdgeInsets.all(Insets.medium),
              child: Container(
                padding: EdgeInsets.all(BorderSize.exSmall),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(BorderSize.medium),
                ),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: _nextPage,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}