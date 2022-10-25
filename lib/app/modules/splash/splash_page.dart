import 'package:data7_api_pix_config/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
