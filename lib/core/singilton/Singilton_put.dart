import 'package:azertexnolayn/screens/admin/pages/admin_page/companent/document_builder/document_builder_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/admin_page/companent/drawer/drawer_widget_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/inside_document_page/inside_document_page_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:get/get.dart';

class SingiltonPut {
  static SingiltonPut? _instate;
  static SingiltonPut get inistance {
    if (_instate != null) return _instate!;
    _instate = SingiltonPut._init();
    return _instate!;
  }


 
  SingiltonPut._init() {
    print('salam');
   Get.put(NewDiscrepancyController());
  Get.put(InsideDocumentPageController());
  Get.put(DrawerWidgetController());
  Get.put(DocumentController());
}

}