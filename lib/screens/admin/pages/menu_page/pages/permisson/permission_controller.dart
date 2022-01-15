

import 'package:get/get.dart';

class PermisiionController extends GetxController {
   var selectUser = 'Elgiz Cebrayilov';
  List listUser = [
    'Ulvi Nebiyev',
    'Elgiz Cebrayilov',
    'Exam1',
    'Exam2',
    'Exam3',
    'Exam4',
    'Exam5'
  ];
  void setUser(var value) {
    selectUser = value;
    update();
  }
  var selectStatus = 'Admin';
  List listStatus = [
    'Admin',
    'Istifadeci',
  ];
  void setStatus(var value) {
    selectStatus = value;
    update();
  }
  var selectVision = 'Hec biri';
  List listVision = [
    'Butun Uygunsuzluqlar',
    'Yalniz bolme',
    'Hec biri',
  ];
  void setVision(var value) {
    selectVision = value;
    update();
  }
}
/*
'Butun mesajlari gorme',
    'Yalniz oz bolmesinin mesajlarini gormek',
    'Hec biri',
*/