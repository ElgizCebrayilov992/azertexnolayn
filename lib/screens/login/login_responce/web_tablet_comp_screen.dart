import 'package:animate_do/animate_do.dart';
import '../../../core/constants/constants_color.dart';
import '../companent/login_page_form.dart';
import '../companent/login_page_svg.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class WebTabletCompScreen extends StatelessWidget {
  const WebTabletCompScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: LoginPageSvg(
                  height:context.dynamicHeight(0.3),
                ),
              ),
              color: AppConstantsColor.compColorBlue,
            ),
          ),
          Expanded(
           
              child: FadeInDown(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicWidth(0.04),
                vertical: context.dynamicHeight(0.1),
              ),
              child: Container(
                alignment: Alignment.center,
                color: AppConstantsColor.compColorBlue,
                child: LoginPageForm(
                  topPadding: context.dynamicHeight(0.04),
                  leftPadding: context.dynamicWidth(0.04),
                  rightPadding: context.dynamicWidth(0.04),
                  sizedBoxHeight: 15,
                  containerHeight: context.dynamicHeight(0.1),
                  containerWidth: context.dynamicWidth(0.35),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
