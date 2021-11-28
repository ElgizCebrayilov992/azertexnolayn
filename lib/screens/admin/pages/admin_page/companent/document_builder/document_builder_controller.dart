import 'package:get/get.dart';

import '../../../../../../test/messaj/mesajJson/mesajJson.dart';
import '../../../../../../test/messaj/mesajModel/mesaj_model.dart';

class DocumentController extends GetxController {
  List<TestMesaj>? list = AllMesaj.mesajList();


  editMesajList(int mesajStatus) {
    
    list = AllMesaj.mesajList(mesajStatus: mesajStatus);
    update();
  }
  
}
