import 'package:get/get.dart';

import 'package:data7_api_pix_config/app/modules/database_config/database_binding.dart';
import 'package:data7_api_pix_config/app/modules/database_config/database_page.dart';

import 'package:data7_api_pix_config/app/modules/manager_config/manager_binding.dart';
import 'package:data7_api_pix_config/app/modules/manager_config/manager_page.dart';
import 'package:data7_api_pix_config/app/modules/home/widgets/home_binding.dart';
import 'package:data7_api_pix_config/app/modules/home/widgets/home_page.dart';
import 'package:data7_api_pix_config/app/modules/login/login_binding.dart';
import 'package:data7_api_pix_config/app/modules/login/login_page.dart';
import 'package:data7_api_pix_config/app/modules/splash/splash_binding.dart';
import 'package:data7_api_pix_config/app/modules/splash/splash_page.dart';
import 'package:data7_api_pix_config/app/routes/app_router.dart';

class AppPageRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouter.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouter.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouter.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouter.DATABASE,
      page: () => DatabasePage(),
      binding: DatabaseBinding(),
    ),
    GetPage(
      name: AppRouter.MANANGER,
      page: () => ManagerPage(),
      binding: ManagerBinding(),
    ),
  ];
}
