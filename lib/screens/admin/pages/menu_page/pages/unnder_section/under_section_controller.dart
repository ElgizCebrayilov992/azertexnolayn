import 'package:get/get.dart';

class UnderSectionController extends GetxController{
   var selectUpSection = 'TX ve TŞ';
  List listUpSection = [
    'TX ve TŞ',
    'Elgiz Cebrayilov',
    'Exam1',
    'Exam2',
    'Exam3',
    'Exam4',
    'Exam5'
  ];
  void setUser(var value) {
    selectUpSection = value;
    update();
  }
}
  
