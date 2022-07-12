import 'package:design_flutter/router/router_name.dart';
import 'package:design_flutter/screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouterName.splash,
        page: () => const SplashScreen(),
      ),
      // GetPage(
      //     name: RouterName.search,
      //     page: () => const SearchPage(),
      //     binding: SearchBinding()),
    ];
  }
}
