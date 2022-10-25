import 'package:data7_api_pix_config/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    this._setDefaultConfiDatabase(this.databaseSelected);
  }

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final serverController = TextEditingController();
  final portController = TextEditingController();

  final List<String> databases = <String>[' SQL-SERVER ', ' SYBASE '].obs;
  String databaseSelected = ' SQL-SERVER ';

  setDatabaseSelected(String value) {
    this.databaseSelected = value;
    this._setDefaultConfiDatabase(value);
    update();
  }

  String? validUserNameController(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'User Name is required';
    }

    return null;
  }

  String? validPasswordController(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'Password is required';
    }

    return null;
  }

  String? validServerController(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'Server is required';
    }

    return null;
  }

  String? validPortController(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      print(value);
      return 'Port is required';
    }

    return null;
  }

  _setDefaultConfiDatabase(String? database) {
    if (database == ' SQL-SERVER ') {
      this.userNameController.text = 'sa';
      this.passwordController.text = '123abc.';
      this.serverController.text = 'localhost';
      this.portController.text = '1433';
    }

    if (database == ' SYBASE ') {
      this.userNameController.text = 'dba';
      this.passwordController.text = 'sql';
      this.serverController.text = 'localhost';
      this.portController.text = '2638';
    }
  }

  subimit() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRouter.MANANGER);
    }
  }

  @override
  void onClose() {
    this.userNameController.dispose();
    this.passwordController.dispose();
    this.serverController.dispose();
    this.portController.dispose();
    super.onClose();
  }
}
