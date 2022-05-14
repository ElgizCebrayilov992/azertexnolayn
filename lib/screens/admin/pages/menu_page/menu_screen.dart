import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/companent/customer_menu_button.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/finding/finding_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/position/position_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/profil/profil_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_screen.dart';
import 'package:azertexnolayn/screens/registration/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/applies/applies_screen.dart';
import 'pages/causes/causes_screen.dart';
import 'pages/raised/raised_screen.dart';
import 'pages/section/section_screen.dart';
import 'pages/worker/worker_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(AppConstantsText.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomerMenuButton(
                child: ProfilScreen(), title: AppConstantsText.profil),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: PositionScreen(), title: AppConstantsText.position)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: UserScreen(), title: AppConstantsText.worker)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: FindingScreen(), title: AppConstantsText.finding)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: AppliesScreen(), title: AppConstantsText.applies)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: SectionScreen(), title: AppConstantsText.section)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: RaisedScreen(), title: AppConstantsText.raised)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: AppliesScreen(), title: AppConstantsText.applies)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: CausesScreen(), title: AppConstantsText.causes)
                : const SizedBox(),
            userController.model.authority_id == '2'
                ? CustomerMenuButton(
                    child: RegistrationPage(), title: AppConstantsText.other)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
