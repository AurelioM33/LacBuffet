import 'package:get/get.dart';
import 'package:lac_buffet/scr/pages/auth/view/sign_up_screen.dart';
import 'package:lac_buffet/scr/pages/auth/view/sing_in_screen.dart';
import 'package:lac_buffet/scr/pages/base/base_screen.dart';
import 'package:lac_buffet/scr/pages/base/binding/navigation_binding.dart';
import 'package:lac_buffet/scr/pages/home/binding/home_binding.dart';
import 'package:lac_buffet/scr/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SingInScreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SingUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => BaseScreen(),
      name: PagesRoutes.baseRoute,
      bindings: [
        NavigationBinding(),
        HomeBindings(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
