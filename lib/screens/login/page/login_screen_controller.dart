
import '../../admin/pages/admin_page/admin_page.dart';

import 'login_page.dart';
import '../../users/user_page.dart';
import '../../../test/user/testJson/TestJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController {
  loginScreenController(
      {GlobalKey<FormState>? formKey,
      TextEditingController? controllerMail,
      TextEditingController? controllerPass}) {
    if (formKey!.currentState!.validate()) {
      formKey.currentState!.save();
      int? index = TestJson.loginPage(
          mail: controllerMail!.text, password: controllerPass!.text);

      if (index == 1) {
        Get.off(AdminPage());
      } else if (index == 0) {
        Get.off(const UserPage());
      } else {
        Get.off(const LoginPage());
      }
    }
  }
}
