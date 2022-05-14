import 'package:azertexnolayn/core/getx_controller/local_model_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/all_read_page/all_read_page.dart';
import 'package:azertexnolayn/screens/kis_page_main/kis_page_main.dart';
import 'package:azertexnolayn/screens/one_read_page/one_read_page.dart';
import 'package:azertexnolayn/screens/section_read_page/section_read_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController serverPath = TextEditingController();

  TextEditingController imagePath = TextEditingController();

  UserController userController = Get.find<UserController>();

  LocalModelControler localModelCOntroller = Get.find<LocalModelControler>();

  @override
  Widget build(BuildContext context) {
    localModelCOntroller.getLocalModel;
    print(localModelCOntroller.model?.imagePath);
    print(localModelCOntroller.model?.serverPath);
   serverPath = TextEditingController(text: localModelCOntroller.model?.serverPath??"");

   imagePath = TextEditingController(text:imagePath.text.isNotEmpty ?imagePath.text: localModelCOntroller.model?.imagePath??"");
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomerTextField(
                title: 'Server adresi:',
                hintText: 'Məsələn: 192.168.1.1',
                controller: serverPath),
            userController.model.authority_id == '2'
                ? GetPlatform.isDesktop
                    ? Row(
                        //  mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomerTextField(
                                title: 'Server adresi:',
                                hintText: 'F:\\Azertexnolayn_MMC\\logo.svg',
                                controller: imagePath),
                          ),
                          IconButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['svg', 'jpeg']);
                                if (result != null) {
                                  PlatformFile file = result.files.first;

                                  imagePath =
                                      TextEditingController(text: file.path);
                                } else {
                                  // User canceled the picker
                                }
                                setState(() {
                                  
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.blue,
                              ))
                        ],
                      )
                    : const SizedBox()
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (imagePath.text.isEmpty || imagePath.text == null) {
                      localModelCOntroller.addLocalModel(
                          serverPath: serverPath.text);
                    } else {
                      localModelCOntroller.addLocalModel(
                          serverPath: serverPath.text,
                          imagePath: imagePath.text);
                    }
                    Get.off(() {
                      if (userController.model.authority_id == '2') {
                        return  KisPageMain();
                      } else {
                        if (userController.model.user_status_id == '1') {
                          return const SectionReadPage();
                        } else if (userController.model.user_status_id == '3') {
                          return const AllReadPage();
                        } else {
                          return  OneReadPage();
                        }
                      }
                    });
                  },
                  child: const Text('Yadda saxla')),
            )
          ],
        ),
      ),
    );
  }
}
