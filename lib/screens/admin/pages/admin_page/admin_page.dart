import '../../../../core/constants/constants_color.dart';
import '../../../../core/constants/constants_text.dart';

import '../../../../core/response/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'companent/app_bar_widget.dart';
import 'companent/drawer/drawer_widget.dart';
import 'companent/drawer/drawer_widget_controller.dart';

class AdminPage extends StatelessWidget {
  final DrawerWidgetController dwc = Get.find();
  //final DrawerWidgetController dwc =  Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstantsColor.compColorBlue,
        drawer: DrawerPage(),
        appBar: PreferredSize(
          child: (ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLimit(context))
              ? Container()
              : const AppBarWidget(
                  index: 0,
                ),
          preferredSize: const Size(double.infinity, 100),
        ),
        body: GetBuilder<DrawerWidgetController>(
          builder: (controller) {
            if (ResponsiveLayout.isComputer(context) ||
                ResponsiveLayout.isLargeTablet(context)) {
                  print('Komp');
              return Row(
                children: [
                  Expanded(
                    child: DrawerPage(),
                    flex: 1,
                  ),
                  Expanded(
                      flex: ResponsiveLayout.isLargeTablet(context) ? 4 : 5,
                      child: GetBuilder<DrawerWidgetController>(
                        builder: (controller) => dwc.curentWidget,
                      )),
                ],
              );
            } else if (ResponsiveLayout.isTinyLimit(context)) {
              print('Tiny');
              return Container();
            } else {
              print('Phone');
              return dwc.curentWidget;
            }
          },
        ));
  }
}
/*
ResponsiveLayout(
        tiny: Container(),
        phone: GetBuilder<DrawerWidgetController>(
          builder: (controller) {
            print('telefon');
            return dwc.curentWidget;
          } 
        ),
        tablet: GetBuilder<DrawerWidgetController>(
          builder: (controller) => dwc.curentWidget,
        ),
        largeTablet: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(
              flex: 4,
                child: GetBuilder<DrawerWidgetController>(
              builder: (controller) => dwc.curentWidget,
            )),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage(),flex: 1,),
            Expanded(
              flex: 5,
                child: GetBuilder<DrawerWidgetController>(
              builder: (controller) => dwc.curentWidget,
            )),
          ],
        ),
      )
*/