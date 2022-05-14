import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/menu_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/profil/companent/customer_text_and_texfiled.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_button.dart';
import 'package:azertexnolayn/test/excel/excel_save.dart';
import 'package:azertexnolayn/validator/string_validator_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();
  TextEditingController fullName = TextEditingController(text: 'ad');

  TextEditingController mail = TextEditingController(text: 'Mail');
  TextEditingController phone = TextEditingController(text: 'Phone');
  TextEditingController password = TextEditingController(text: 'Password');
  @override
  Widget build(BuildContext context) {
    fullName = TextEditingController(text: userController.model.name ?? 'ad');

    mail = TextEditingController(text: userController.model.mail ?? 'Mail');
    phone = TextEditingController(text: userController.model.phone ?? 'Phone');
    var formKey1 = GlobalKey<FormState>();
    password = TextEditingController(
        text: userController.model.password ?? 'Password');
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstantsText.profil),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
           key: formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerTextAndTextField(
                validator: (value) =>value!.isEmpty ?'bu hisse boş ola bilməz':null,
                  controller: fullName, title: AppConstantsText.name),
              CustomerTextAndTextField(
                validator: (value) =>
                    value!.isValidEmail1 ? null : AppConstantsText.validEmail,
                controller: mail,
                title: AppConstantsText.mail,
              ),
              CustomerTextAndTextField(
                 validator: (value) =>value!.isEmpty ?'bu hisse boş ola bilməz':null,
                  controller: phone, title: AppConstantsText.phone),
              CustomerTextAndTextField(
                  validator: (value) =>
                      value!.isValidPass ? null : AppConstantsText.validPass,
                  controller: password,
                  title: AppConstantsText.password),
              Row(
                children: [
                  CustomerButton(
                    title: AppConstantsText.update,
                    color: Colors.green,
                    onPressed: () {
                     if (formKey1.currentState!.validate()) {
                       userController.updateProfil(fullName.text, phone.text, mail.text, password.text,userController.model.id);
                     Get.back();
                     }
                    },
                  ),
                  CustomerButton(
                    title: AppConstantsText.cancell,
                    color: Colors.red,
                    onPressed: () {
                      Get.back();
                      //ExcelSave.createExcel();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
