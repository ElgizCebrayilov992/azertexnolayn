import 'package:get/get.dart';

class WorkerController extends GetxController{
  var selectPosition = 'İnspector';
  List listPosition = [
    'İnspector',
    'Mühəndis',
    'Exam1',
    'Exam2',
    'Exam3',
    'Exam4',
    'Exam5'
  ];
  void setApplies(var value) {
    selectPosition = value;
    update();
  }
  var selectBolme = 'Keyfiyyet';
  List listBolme = [
    'Keyfiyyet',
    'asdsdsdsads',
    'Exasdasdsdsdsm1',
    'Exasdsfdyiuiuyhjhm2',
    'Exam3',
    'Exam4',
    'Exam5'
  ];
  void setBolme(var value) {
    selectBolme = value;
    update();
  }
}
  
