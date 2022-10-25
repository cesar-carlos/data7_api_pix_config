import 'package:data7_api_pix_config/app/modules/home/widgets/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: Center(child: Text('Home')),
      ),
    );
  }
}
