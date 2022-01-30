import 'package:get/route_manager.dart';
import 'package:marvel_persons/bindings/creators/creators_bindings.dart';
import 'package:marvel_persons/bindings/dashboard_bindings.dart';
import 'package:marvel_persons/bindings/character/character_bindings.dart';
import 'package:marvel_persons/bindings/hqs/hqs_controller.dart';
import 'package:marvel_persons/bindings/login_bindings.dart';
import 'package:marvel_persons/bindings/splash_bindings.dart';
import 'package:marvel_persons/pages/creators/creators.dart';
import 'package:marvel_persons/pages/dashboard.dart';
import 'package:marvel_persons/pages/hqs/hqs.dart';
import 'package:marvel_persons/pages/character/characters.dart';
import 'package:marvel_persons/pages/login.dart';
import 'package:marvel_persons/pages/not_found.dart';
import 'package:marvel_persons/pages/splash.dart';

import 'routes.dart';

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
          name: Routes.login,
          page: () => LoginPage(),
          arguments: 0,
          binding: LoginBinding(),
        ),
        GetPage(
          name: Routes.dashboard,
          page: () => DashBoardPage(),
          arguments: 0,
          binding: DashboardBinding(),
        ),
        GetPage(
          name: Routes.characters,
          page: () => CharacterPage(),
          arguments: 0,
          binding: CharacterBinding(),
        ),
        GetPage(
          name: Routes.creators,
          page: () => CreatorsPage(),
          arguments: 0,
          binding: CreatorsBinding(),
        ),
        GetPage(
          name: Routes.hqs,
          page: () => HQSPage(),
          arguments: 0,
          binding: HQSBinding(),
        ),
      ];
}
