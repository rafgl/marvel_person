import 'package:get/route_manager.dart';
import 'package:marvel_persons/bindings/home_bindings.dart';
import 'package:marvel_persons/bindings/splash_bindings.dart';
import 'package:marvel_persons/pages/home.dart';
import 'package:marvel_persons/pages/not_found.dart';
import 'package:marvel_persons/pages/splash.dart';

import 'rutes.dart';

class AppPages {
  static GetPage get notFound => GetPage(
        name: Routes.notFound,
        page: () => const NotFoundPage(),
      );
  static List<GetPage> get pages => [
        GetPage(
          name: Routes.splash,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.home,
          page: () => HomePage(),
          arguments: 0,
          binding: HomeBinding(),
        ),
      ];
}
