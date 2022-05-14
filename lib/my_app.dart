import 'package:azertexnolayn/core/getx_controller/local_model_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/admin_page/admin_page.dart';
import 'package:azertexnolayn/screens/login/page/login_page.dart';
import 'package:get/get.dart';

import 'core/constants/constants_color.dart';
import 'package:flutter/material.dart';

import 'screens/admin/pages/menu_page/pages/user/user_screen.dart';



class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: AppConstantsColor.purpleDark),
      title: 'Material App',
      home:  LoginPage(),
    );
  }
}
