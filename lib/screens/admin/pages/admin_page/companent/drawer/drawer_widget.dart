
import '../../../../../../core/constants/constants.dart';
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
      title: AppConstants.drawerAllMessage, icon: Icons.email), //butun sened
  //oxunmayan
  ButtonsInfo(
      title: AppConstants.drawerWaitMessage,
      icon: Icons.hourglass_bottom), //gozluyen
  ButtonsInfo(
      title: AppConstants.drawerAcceptUserMessage, icon: Icons.mark_email_read),
  ButtonsInfo(
      title: AppConstants.drawerAcceptWaitMessage,
      icon: Icons.gavel_outlined), //tesdiqleyen
  ButtonsInfo(title: AppConstants.drawerReturnMessage, icon: Icons.reply),
  ButtonsInfo(title: AppConstants.drawerAcceptAdminMessage, icon: Icons.check),
  ButtonsInfo(
      title: AppConstants.drawerCancelMessage,
      icon: Icons.speaker_notes_off), //legv
  //geri donus
];

class DrawerPage extends GetView<DrawerWidgetController>{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: GetBuilder<DrawerWidgetController>(
          builder: (controller) => Column(
            children: [
              ListTile(
                title: Text(
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
                        icon: Icon(Icons.close, color: Colors.white),
                      ):null
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
                                  AppConstants.adminColorRed.withOpacity(0.9),
                                  AppConstants.adminColorOrange
                                      .withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        //TODO BURDA MESAJ SAYI OLACAQ
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(
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
                        
                          update(controller);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
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
    DocumentController ctr=Get.find();
    switch (dwc.curentIndex) {
     
      case 0:
       ctr.editMesajList(0);
        dwc.setCurentWidget(DocumentScreen());

        break;
      case 1:
      ctr.editMesajList(1);
        dwc.setCurentWidget(DocumentScreen());
        break;
        case 2:
      ctr.editMesajList(2);
        dwc.setCurentWidget(DocumentScreen());
        break;
        case 3:
      ctr.editMesajList(3);
        dwc.setCurentWidget(DocumentScreen());
        break;
        case 4:
      ctr.editMesajList(4);
        dwc.setCurentWidget(DocumentScreen());
        break;
        case 5:
      ctr.editMesajList(5);
        dwc.setCurentWidget(DocumentScreen());
        break;
        case 6:
      ctr.editMesajList(6);
        dwc.setCurentWidget(DocumentScreen());
        break;
      default:
    }
  }
}
/*


*/