import '../../../../../../core/constants/constants_color.dart';

import '../../../../../../core/constants/constants_text.dart';
import '../../../../../login/companent/login_page_svg.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

class HeaderLeftLogo extends StatelessWidget {
  const HeaderLeftLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoginPageSvg(
        color: AppConstantsColor.compColorBlue,
        height: context.dynamicHeight(0.12),
      ),
    );
  }
}