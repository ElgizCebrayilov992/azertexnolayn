import 'package:azertexnolayn/screens/admin/pages/menu_page/menu_screen.dart';

import '../../../../../../core/constants/constants_color.dart';

import '../../../../../../core/constants/constants_text.dart';
import '../../../../../../core/response/responsive_layout.dart';
import '../document_builder/document_builder_controller.dart';
import '../document_builder/document_builder_widget.dart';

import 'drawer_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(
      title: AppConstantsText.drawerAllMessage,
      icon: Icons.email), //butun sened
  //oxunmayan
  ButtonsInfo(
      title: AppConstantsText.drawerWaitMessage,
      icon: Icons.hourglass_bottom), //gozluyen
  ButtonsInfo(
      title: AppConstantsText.drawerAcceptUserMessage,
      icon: Icons.mark_email_read),
  ButtonsInfo(
      title: AppConstantsText.drawerAcceptWaitMessage,
      icon: Icons.gavel_outlined), //tesdiqleyen
  ButtonsInfo(title: AppConstantsText.drawerReturnMessage, icon: Icons.reply),
  ButtonsInfo(
      title: AppConstantsText.drawerAcceptAdminMessage, icon: Icons.check),
  ButtonsInfo(
      title: AppConstantsText.drawerCancelMessage,
      icon: Icons.speaker_notes_off), //legv
  ButtonsInfo(title: AppConstantsText.drawerMenu, icon: Icons.settings), //legv
  //geri donus
];

class DrawerPage extends GetView<DrawerWidgetController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: GetBuilder<DrawerWidgetController>(
          builder: (controller) => Column(
            children: [
              ListTile(
                title: const Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? !ResponsiveLayout.isLargeTablet(context)
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close, color: Colors.white),
                          )
                        : null
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == controller.curentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  AppConstantsColor.adminColorRed
                                      .withOpacity(0.9),
                                  AppConstantsColor.adminColorOrange
                                      .withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        //TODO BURDA MESAJ SAYI OLACAQ
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          controller.setCurentIndex(index);
//TODO
                          update(controller);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void update(DrawerWidgetController dwc) {
    DocumentController ctr = Get.find();
    if (dwc.curentIndex == 7) {
      Get.to(MenuScreen());
    } else {
      ctr.editMesajList(dwc.curentIndex);
    }
  }
}
/*


*/