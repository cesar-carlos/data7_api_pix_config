import 'package:data7_api_pix_config/app/modules/splash/splash_binding.dart';
import 'package:data7_api_pix_config/app/modules/splash/splash_page.dart';
import 'package:data7_api_pix_config/app/routes/app_page_router.dart';
import 'package:data7_api_pix_config/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data7 API Pix',
      theme: AppTheme().materialTheme,
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPageRouter.pages,
    );
  }
}
