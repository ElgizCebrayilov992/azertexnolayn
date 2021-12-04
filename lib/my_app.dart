
import 'package:get/get.dart';

import 'core/constants/constants_color.dart';
import 'screens/admin/pages/new_discrepancy/new_discrepancy.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(canvasColor: AppConstantsColor.purpleDark),
      title: 'Material App',
      home: NewDiscrepancy(),
    );
  }
}