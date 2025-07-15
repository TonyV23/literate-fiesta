import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pablo/controllers/theme_controller.dart';
import 'package:pablo/utils/app_themes.dart';
import 'package:pablo/views/splash_screen.dart';


void main() async{

  // initializing and loading theme from storage
  await GetStorage.init();
  Get.put(ThemeController());



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      title: 'devJunkie',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
     
      home: const SplashScreen(),
    );
  }
}

