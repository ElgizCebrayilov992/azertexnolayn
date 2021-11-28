import '../../../../../core/constants/constants.dart';
import '../../../../../core/response/responsive_layout.dart';
import '../../new_discrepancy/new_discrepancy.dart';
import '../../../../login/page/login_page.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final int index;

  const AppBarWidget({Key? key, required this.index}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.purpleLight.withOpacity(0.9),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!ResponsiveLayout.isComputer(context) &&
              !ResponsiveLayout.isLargeTablet(context))
            if (widget.index == 0)
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              )
            else
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Get.back(canPop: false);
                },
                icon: Icon(Icons.arrow_back),
              )
          else
            widget.index == 0
                ? Text('')
                : IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Get.back(canPop: false);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
          Spacer(),
           if(widget.index==0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              IconButton(
                tooltip: 'Yeni uyğunsuzluq',
                onPressed: () {
                  Get.to(()=>NewDiscrepancy());
                },
                icon: Icon(
                  Icons.note_add,
                  color: AppConstants.compColorWhite,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.offAll(LoginPage());
                },
                icon: Icon(
                  Icons.logout,
                  color: AppConstants.compColorWhite,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
