import '../document_builder/document_builder_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidgetController extends GetxController {
  int curentIndex = 0;
  Widget curentWidget = DocumentScreen();
  setCurentIndex(int index) {
    curentIndex = index;
    update();
  }

  setCurentWidget(Widget widget) {
    curentWidget = widget;
    update();
  }
}
