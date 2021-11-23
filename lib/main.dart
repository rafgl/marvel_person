import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/services/http.dart';
import 'package:marvel_persons/utils/pages.dart';
import 'package:marvel_persons/utils/rutes.dart';
import 'package:marvel_persons/utils/strings.dart';

import 'services/storage.dart';

Future<void> initApp() async {
  await Get.putAsync(() => StorageService().init());
  Get.put(HttpService());

  runApp(const MyApp());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initApp();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      popGesture: false,
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      unknownRoute: AppPages.notFound,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Bitter",
      ),
    );
  }
}
