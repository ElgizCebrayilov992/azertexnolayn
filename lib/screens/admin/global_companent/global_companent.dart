import '../../../core/constants/constants_color.dart';

import '../../../core/response/responsive_layout.dart';
import '../pages/admin_page/companent/app_bar_widget.dart';
import 'package:flutter/material.dart';

Divider divider() =>const Divider(thickness: 2, color: AppConstantsColor.compColorBlue);
  PreferredSize appBarSection(BuildContext context) {
    return PreferredSize(
      child: (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context))
          ? Container()
          : const AppBarWidget(index: 1),
      preferredSize: const Size(double.infinity, 100),
    );
  }