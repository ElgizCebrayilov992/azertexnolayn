import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/local_model/local_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalModelControler extends GetxController {
  var loading = Loading.LOADING;
  LocalModel? model;
  @override
  void onInit() {
    try {
      Hive.registerAdapter(LocalModelAdapter());
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    getLocalModel();
// await Hive.openBox('LocalModel');
    super.onInit();
  }

  addLocalModel({required String serverPath, String? imagePath}) async {
    if (imagePath == null) {
      model = LocalModel(serverPath: serverPath);
    } else {
      model = LocalModel(serverPath: serverPath, imagePath: imagePath);
    }
    Box box = await Hive.openBox('LocalModel');
    box.put('model', model);
    getLocalModel();
  }

  editLocalModel({required String serverPath, String? imagePath}) async {
    if (imagePath == null) {
      model = LocalModel(serverPath: serverPath);
    } else {
      model = LocalModel(serverPath: serverPath, imagePath: imagePath);
    }
    Box box = await Hive.openBox('LocalModel');
    box.put('model', model);

    getLocalModel();
  }

  Future<bool> getLocalModel() async {
     loading = Loading.LOADING;
    Box box;
    
    try {
     
      box = await Hive.openBox("LocalModel");

    } catch (e) {
    
      box = await Hive.openBox("LocalModel");
    
    }

    LocalModel? tds = box.get('model');
  

    if (tds?.serverPath != null) {
      loading = Loading.DONE;
      model = tds;
      update();
      return true;
    } else {
      loading = Loading.EMPTY;
      update();
      return false;
    }
  }
}
