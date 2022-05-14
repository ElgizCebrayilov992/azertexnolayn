import 'package:azertexnolayn/core/getx_controller/user_auth_controller.dart';
import 'package:azertexnolayn/core/getx_controller/user_status_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/applies/applies_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/causes/causes_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/finding/finding_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/getx_controller/local_model_controller.dart';
import 'screens/admin/pages/admin_page/companent/document_builder/document_builder_controller.dart';
import 'screens/admin/pages/admin_page/companent/drawer/drawer_widget_controller.dart';
import 'screens/admin/pages/inside_document_page/inside_document_page_controller.dart';
import 'screens/admin/pages/menu_page/pages/position/position_controller.dart';
import 'screens/admin/pages/menu_page/pages/raised/raised_controller.dart';
import 'screens/admin/pages/menu_page/pages/section/section_controller.dart';
import 'screens/admin/pages/menu_page/pages/worker/worker_controller.dart';
import 'screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_app.dart';

main() async {
  await Hive.initFlutter();

  Get.put(PositionController());
  Get.put(SectionController());

  Get.put(UserStatusController());
Get.put(CausesController());
  Get.put(UserAuthController());
  Get.put(RaisedController());
  Get.put(AppliesController());
   Get.put(FindingController());
  Get.put(UserController());
  
  Get.put(NewDiscrepancyController());
  Get.put(InsideDocumentPageController());
  Get.put(DrawerWidgetController());
  Get.put(DocumentController());
  Get.put(WorkerController());
 

  Get.put(AppliesController());
  Get.put(FindingController());
  Get.put(LocalModelControler());

  runApp(MyApp());
}
//