import '../../../core/constants/constants_color.dart';

import '../companent/clipper_widget.dart';
import '../companent/login_page_form.dart';
import '../companent/login_page_svg.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class SmallTabletScreen extends StatelessWidget {
  const SmallTabletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                alignment: Alignment.topCenter,
                color: AppConstantsColor.compColorBlue,
                child: LoginPageSvg(
                  height: context.dynamicHeight(0.3),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.dynamicHeight(0.06),
                  horizontal: context.dynamicHeight(0.1)),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppConstantsColor.compColorBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: LoginPageForm(
                  containerHeight: context.dynamicHeight(0.07),
                  containerWidth: context.dynamicWidth(0.75),
                  sizedBoxHeight: 15,
                  leftPadding: context.dynamicWidth(0.03),
                  rightPadding: context.dynamicWidth(0.03),
                  topPadding: context.dynamicHeight(0.03),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}