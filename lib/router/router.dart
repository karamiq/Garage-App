import 'package:Trip/pages/create_account_type/create_account_type.dart';
import 'package:Trip/pages/enter_holder_or_owner_info_page/enter_holder_or_owner_info_page.dart';
import 'package:Trip/pages/enter_personal_picture/enter_personal_picture.dart';
import 'package:Trip/pages/keep_going/keep_going.dart';
import 'package:Trip/pages/login_or_rigister/login_or_rigister.dart';
import 'package:Trip/pages/otp/otp.dart';
import 'package:Trip/pages/owner_car_info.dart/owner_car_info.dart';
import 'package:Trip/pages/qr_code/qr_code.dart';
import 'package:Trip/pages/register/register.dart';
import 'package:Trip/pages/splash/splash_page.dart';
import 'package:Trip/pages/taps_page/taps.dart';
import 'package:Trip/pages/where_do_you_want_to_work/where_do_you_want_to_work.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> generateRoutes() {
  return [
    GetPage(
      name: Routes.splashPageRoute,
      page: () => SplashPage(),
      //page: () => SplashPage(),
      children: [
        //GetPage(name: '/details', page: () => DetailsScreen()), // Nested route
      ],
    ),
    GetPage(
        name: Routes.tapsPage, page: () => TapsPage()),
    GetPage(
        name: Routes.loginOrRigisterPage, page: () => LoginOrRigisterPage()),
    GetPage(name: Routes.otpPage, page: () => OtpPage()),
    GetPage(name: Routes.registerPage, page: () => RegisterPage()),
    GetPage(
      name: Routes.createAccountType,
      page: () => CreateAccountTypePage(),
    ),
    GetPage(
        name: Routes.enterHolderOrOwnerInfoPage,
        page: () => EnterHolderOrOwnerInfoPage()),
    GetPage(name: Routes.ownerCarInfoPage, page: () => OwnerCarInfoPage()),
    GetPage(
        name: Routes.enterPersonalPicturePage,
        page: () => EnterPersonalPicturePage()),
    GetPage(name: Routes.createQrCodePage, page: () => CreateQrCodePage()),
    GetPage(name: Routes.keepGoingPage, page: () => KeepGoingPage()),
    GetPage(
        name: Routes.whereDoYouWantToWorkPage,
        page: () => WhereDoYouWantToWorkPage()),
  ];
}

class Routes {
  static const tapsPage = '/taps_page';
  static const whereDoYouWantToWorkPage = '/where_do_you_want_to_work';
  static const keepGoingPage = '/keep_going_page';
  static const createQrCodePage = '/create_qr_code';
  static const enterPersonalPicturePage = '/enter_personal_picture';
  static const ownerCarInfoPage = '/owner_car_info';
  static const enterHolderOrOwnerInfoPage = '/enter_holder_or_owner_info';
  static const createAccountType = '/create_account_type';
  static const splashPageRoute = '/splash';
  static const loginOrRigisterPage = '/login_or_rigister';
  static const otpPage = '/otp';
  static const registerPage = '/register';
}
