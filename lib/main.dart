import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proza/controllers/main_page_controller.dart';
import 'package:proza/pages/main_page.dart';

import 'controllers/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lazy load the controllers.
  Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<MainPageController>(() => MainPageController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Proza',
      onReady: () => {},
      //translations: Messages();
      theme: ThemeData.light().copyWith(primaryColor: Colors.lightBlue),
      darkTheme: ThemeData.light().copyWith(primaryColor: Colors.blue),
      themeMode: ThemeController.to.themeMode!,
      home: MainPage(),
    );
  }
}
