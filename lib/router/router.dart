import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/card_page/money_transfering.dart';
import 'package:Trip/pages/create_account/enter_holder_or_owner_info_page/enter_holder_or_owner_info_page.dart';
import 'package:Trip/pages/create_account/enter_personal_picture/enter_personal_picture.dart';
import 'package:Trip/pages/create_account/keep_going/keep_going.dart';
import 'package:Trip/pages/auth/login_or_rigister/login_or_rigister.dart';
import 'package:Trip/pages/auth/otp/otp.dart';
import 'package:Trip/pages/create_account/owner_car_info.dart/owner_car_info.dart';
import 'package:Trip/pages/create_account/qr_code/qr_code.dart';
import 'package:Trip/pages/auth/register/register.dart';
import 'package:Trip/pages/home_page/fee_detailes/fee_detailes.dart';
import 'package:Trip/pages/home_page/fees_on_car/fees_on_car.dart';
import 'package:Trip/pages/home_page/financial_transcations/financial_transcations.dart';
import 'package:Trip/pages/home_page/garage_rating/garage_rating.dart';
import 'package:Trip/pages/home_page/profile/profile.dart';
import 'package:Trip/pages/shared_pages/qr_code_generator/qr_code_generator.dart';
import 'package:Trip/pages/shared_pages/sending_complain/sending_complain.dart';
import 'package:Trip/pages/home_page/trip_detailes/trip_detailes.dart';
import 'package:Trip/pages/home_page/trips/trips.dart';
import 'package:Trip/pages/shared_pages/notifications.dart';
import 'package:Trip/pages/splash/splash_page.dart';
import 'package:Trip/pages/taps_page/taps.dart';
import 'package:Trip/pages/create_account/where_do_you_want_to_work/where_do_you_want_to_work.dart';
import 'package:Trip/pages/veichles_page/all_available_drivers/all_available_drivers.dart';
import 'package:Trip/pages/veichles_page/all_veichles/all_veichles.dart';
import 'package:Trip/pages/veichles_page/selected_car_info/selected_car_info.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/create_account/create_account_type/create_account_type.dart';

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
    GetPage(name: Routes.tapsPage, page: () => TapsPage()),
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
    GetPage(
        name: Routes.qrCodeGeneratorPage, page: () => QrCodeGEneratorPage()),
    GetPage(name: Routes.seeAllPage, page: () => SeeAllMoneyTransferingPage()),
    GetPage(name: Routes.notificationsPage, page: () => NotificationsPage()),
    GetPage(name: Routes.tripsPage, page: () => TripsPage(), children: [
      GetPage(name: Routes.trpiDetailesPage, page: () => TripDetailesPage())
    ]),
    GetPage(name: Routes.feesOnCarPage, page: () => FeesOnCarPage(), children: [
      GetPage(name: Routes.feeDetailesPage, page: () => FeeDetailesPage()),
      GetPage(
          name: Routes.sendingComplainPage, page: () => SendingComplainPage())
    ]),
    GetPage(name: Routes.profilePage, page: () => ProfilePage(), children: [
      GetPage(
          name: Routes.financialTranscationsPage,
          page: () => FinancialTranscationsPage()),
      GetPage(name: Routes.garageRatingPage, page: () => GarageRatingPage()),
    ]),
    GetPage(
        name: Routes.allAvailableDriversPage,
        page: () => AllAvailableDriversPage()),
    GetPage(name: Routes.allVeichlesPage, page: () => AllVeichlesPage()),
    GetPage(name: Routes.selectedCarInfoPage, page: () => SelectedCarInfoPage())
  ];
}

class Routes {
  static const selectedCarInfoPage = '/selected_car_info';
  static const allAvailableDriversPage = '/all_available_drivers';
  static const allVeichlesPage = '/all_veichles';
  static const garageRatingPage = '/garage_rating';
  static const financialTranscationsPage = '/financial_transcations';
  static const profilePage = '/profile';
  static const sendingComplainPage = '/sending_complain';
  static const feeDetailesPage = '/fee_detailes';
  static const feesOnCarPage = '/fees_on_car';
  static const trpiDetailesPage = '/trip_detailes';
  static const tripsPage = '/trips_page';
  static const notificationsPage = '/notifications';
  static const seeAllPage = '/see_all';
  static const qrCodeGeneratorPage = '/qr_code_generator';
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
