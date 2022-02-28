import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/companent/customer_menu_button.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/permisson/permission_page.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/profil/profil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/applies/applies_screen.dart';
import 'pages/causes/causes_screen.dart';
import 'pages/corrective/corrective_screen.dart';
import 'pages/raised/raised_screen.dart';
import 'pages/section/section_screen.dart';
import 'pages/worker/worker_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(AppConstantsText.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           CustomerMenuButton(child: ProfilScreen(), title: AppConstantsText.profil),
           CustomerMenuButton(child: WorkerScreen(), title:  AppConstantsText.worker),
           CustomerMenuButton(child: PermisssionPage(), title:  AppConstantsText.permission),
           CustomerMenuButton(child: SectionScreen(), title:  AppConstantsText.section),
           CustomerMenuButton(child: RaisedScreen(), title:  AppConstantsText.raised),
           CustomerMenuButton(child: AppliesScreen(), title:  AppConstantsText.applies),
           CustomerMenuButton(child: CausesScreen(), title:  AppConstantsText.causes),
           CustomerMenuButton(child: CorrectiveScreen(), title:  AppConstantsText.corrective),
          ],
        ),
      ),
    );
  }
}
