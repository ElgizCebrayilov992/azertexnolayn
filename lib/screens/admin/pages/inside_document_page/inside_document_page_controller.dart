import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsideDocumentPageController extends GetxController {
  bool oneCheck = true;
  bool twoCheck = true;
  GroupController controller = GroupController();
  String accept = 'yes';
  TextEditingController textEditingControllerOne = TextEditingController();
  changeHeaderChek() {
    print(oneCheck);
    oneCheck = !oneCheck;
    update();
  }

  changeAccept(String check) {
    accept = check;
    update();
  }
}
