import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/getx_controller/local_model_controller.dart';
import 'package:azertexnolayn/core/model/user/user_model.dart';
import 'package:azertexnolayn/screens/admin/pages/admin_page/admin_page.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/all_read_page/all_read_page.dart';
import 'package:azertexnolayn/screens/kis_page_main/kis_page_main.dart';
import 'package:azertexnolayn/screens/login/page/error_page.dart';
import 'package:azertexnolayn/screens/login/page/loading_page.dart';
import 'package:azertexnolayn/screens/one_read_page/one_read_page.dart';
import 'package:azertexnolayn/screens/registration/registration_page.dart';
import 'package:azertexnolayn/screens/section_read_page/section_read_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

//  salam123445A@
//  asim@gmail.com
class LoginScreenController {
  loginScreenController(BuildContext context,
      {GlobalKey<FormState>? formKey,
      TextEditingController? controllerMail,
      TextEditingController? controllerPass}) async {
        //
    UserController controller = Get.find<UserController>();
    LocalModelControler controllerLocalModel = Get.find<LocalModelControler>();
    //
    if (formKey!.currentState!.validate()) {
      try {
        await controller.loginUser(controllerMail!.text, controllerPass!.text);
        UserModel model = controller.model;

        if (controller.loading == Loading.EMPTY) {
          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              message: "Səhv parol ya da mail",
            ),
          );
        } else if (controller.loading == Loading.FAILED) {
          Get.off(() => ErrorPage(
                mesaj: controller.mesaj,
              ));
        } else {
          //Silinecek
          Get.off(()=>GetBuilder<UserController>(
            builder: (controllerUser) {
              if (controllerUser.loading == Loading.LOADING) {
                return const LoadingPage();
              } else {
                controllerLocalModel.getLocalModel();
                return GetBuilder<LocalModelControler>(
                  builder: (controllerLocal) {
                    if (controllerLocal.loading == Loading.LOADING) {
                      return const LoadingPage();
                    } else if (controllerLocal.loading == Loading.EMPTY) {
                      return  RegistrationPage();
                    } else {
                      if (model.authority_id == '2') {
                        return  KisPageMain();
                      } else {
                        if (model.user_status_id == '1') {
                          return const SectionReadPage();
                        } else if (model.user_status_id == '3') {
                          return const AllReadPage();
                        } else {
                          return  OneReadPage();
                        }
                      }
                    }
                  },
                );
              }
            },
          ));
        }
      } catch (e) {
     
        Get.to(ErrorPage(
          mesaj: controller.mesaj,
        ));
      }
      /*
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
    */
    }
  }
}
