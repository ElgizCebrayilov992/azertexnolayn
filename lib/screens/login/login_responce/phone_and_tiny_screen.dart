import 'package:animate_do/animate_do.dart';
import '../companent/login_page_form.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/constants.dart';

class PhoneAndTinyScreen extends StatelessWidget {
  const PhoneAndTinyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.loginBackroundImgPath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              AppConstants.compColorBlue.withOpacity(0.5),
              BlendMode.darken),
        ),
      ),
      child: FadeInDown(
        child: LoginPageForm(
              containerHeight: context.dynamicHeight(0.07),
              containerWidth: context.dynamicWidth(0.9),
              sizedBoxHeight: 15,
              leftPadding: context.dynamicWidth(0.03),
              rightPadding: context.dynamicWidth(0.03),
              topPadding: context.dynamicHeight(0.04),
            ),
      ),
    );
  }
}
