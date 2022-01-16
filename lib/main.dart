

import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/permisson/permission_controller.dart';

import 'screens/admin/pages/admin_page/companent/document_builder/document_builder_controller.dart';
import 'screens/admin/pages/admin_page/companent/drawer/drawer_widget_controller.dart';
import 'screens/admin/pages/inside_document_page/inside_document_page_controller.dart';
import 'screens/admin/pages/menu_page/pages/unnder_section/under_section_controller.dart';
import 'screens/admin/pages/menu_page/pages/worker/worker_controller.dart';
import 'screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_app.dart';

void main() {
    Get.put(NewDiscrepancyController());
    Get.put(InsideDocumentPageController());
    Get.put(DrawerWidgetController());
    Get.put(DocumentController());
    Get.put(WorkerController());
    Get.put(PermisiionController());
    Get.put(UnderSectionController());
  runApp(const MyApp());
}
