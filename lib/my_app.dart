
import 'package:get/get.dart';

import 'core/constants/constants_color.dart';
import 'screens/admin/pages/admin_page/admin_page.dart';
import 'package:flutter/material.dart';

import 'screens/admin/pages/menu_page/pages/raised/raised_screen.dart';
import 'screens/login/page/login_page.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: AppConstantsColor.purpleDark),
      title: 'Material App',
      home: RaisedScreen(),
    );
  }
}