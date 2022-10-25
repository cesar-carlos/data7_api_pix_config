import 'package:data7_api_pix_config/app/routes/app_router.dart';
import 'package:data7_api_pix_config/app/model/login_request_model.dart';
import 'package:data7_api_pix_config/app/provider/authentication_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  String? validEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  void login() async {
    try {
      if (formKey.currentState!.validate()) {
        final api = AuthenticationAPI();
        final loginRequestModel = LoginRequestModel(
          email: emailController.text,
          password: passwordController.text,
        );

        final result = await api.login(loginRequestModel);
        Get.offAllNamed(AppRouter.DATABASE);
      }
    } catch (err) {
      Get.snackbar("Login", "usuario ou senha inválidos",
          icon: const Icon(
            Icons.login_outlined,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          colorText: Colors.white,
          backgroundColor: Colors.black26,
          maxWidth: 400.0);
    }
  }

  @override
  void onClose() {
    this.emailController.dispose();
    this.passwordController.dispose();
  }
}
