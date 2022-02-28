
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/causes/causes_screen.dart';
import 'package:get/get.dart';

import 'core/constants/constants_color.dart';
import 'screens/admin/pages/admin_page/admin_page.dart';
import 'package:flutter/material.dart';

import 'screens/admin/pages/menu_page/pages/applies/applies_screen.dart';
import 'screens/admin/pages/menu_page/pages/finding/finding_screen.dart';
import 'screens/admin/pages/menu_page/pages/raised/raised_screen.dart';
import 'screens/admin/pages/menu_page/pages/section/section_screen.dart';
import 'screens/login/page/login_page.dart';



class MyApp extends StatelessWidget {
   
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: AppConstantsColor.purpleDark),
      title: 'Material App',
      home: SectionScreen(),
    );
  }
}