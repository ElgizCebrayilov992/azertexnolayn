
import '../../../core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/response/responsive_layout.dart';
import '../login_responce/phone_and_tiny_screen.dart';
import '../login_responce/small_tablet_screen.dart';
import '../login_responce/web_tablet_comp_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.compColorWhite,
        body: ResponsiveLayout(
          tiny: PhoneAndTinyScreen(),
          phone: PhoneAndTinyScreen(),
          tablet: SmallTabletScreen(),
          largeTablet: WebTabletCompScreen(),
          computer: WebTabletCompScreen(),
        ),
      ),
    );
  }
}