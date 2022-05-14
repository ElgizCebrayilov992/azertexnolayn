import 'package:azertexnolayn/core/model/user/user_model.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/menu_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:azertexnolayn/screens/global_companent/customer_see_message.dart';
import 'package:azertexnolayn/screens/login/page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KisPageMain extends GetView<NewDiscrepancyController> {
   KisPageMain({Key? key}) : super(key: key);
UserController userController=Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ana Səhifə'),
        actions: [
         
          IconButton(
              tooltip: 'Hesabdan çıx',
              onPressed: () {
               userController.model=UserModel();
               Get.off(()=>const LoginPage());
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )),
        ],
      ),
      body:  StreamBuilder<int>(
    stream: controller.getListStreamInconsistency(),
    builder: (
      BuildContext context,
      AsyncSnapshot<int> snapshot,
    ) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Card(child: Center(child:  CircularProgressIndicator()));
      } else if (snapshot.connectionState == ConnectionState.active
          || snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return GetBuilder<NewDiscrepancyController>(builder: (controller) {
          return Card(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    
                  
                    CustomerSeeMessage(
                      title: 'Yazandan gələn uyğunsuzluq',
                      sum: controller.inconsistencyListComeWriter.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Adiyyatdan gələn cavab',
                      sum: controller.inconsistencyListRaised.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Düzəldicidən gələn cavab',
                      sum: controller.inconsistencyListCorrectiv.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Düzəltmədən gələn cavab',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Etirazlar',
                      sum: controller.inconsistencyListEtiraz.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Təsdiq gözləyənlər',
                      sum: controller.inconsistencyListWaitingAccept.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Bağlanan uyğunsuzluqlar',
                      sum: controller.inconsistencyListClossed.length.toString(),
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Menu',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () =>Get.to(()=> MenuScreen()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

        },);
        } else {
          return const Text('Empty data');
        }
      } else {
        return Text('State: ${snapshot.connectionState}');
      }
    },
  ),
    );
  }
}
/*


Card(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomerSeeMessage(
                      title: 'Yeni uyğunsuzluq',
                      sum: '0',
                      icon: Icons.fiber_new,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                  
                    CustomerSeeMessage(
                      title: 'Prosesdə olan',
                      sum: '0',
                      icon: Icons.sync,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Yazandan gələn uyğunsuzluq',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Adiyyatdan gələn cavab',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Düzəldicidən gələn cavab',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Düzəltmədən gələn cavab',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Etirazlar',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Təsdiq gözləyənlər',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Bağlanan uyğunsuzluqlar',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () {},
                    ),
                    CustomerSeeMessage(
                      title: 'Menu',
                      sum: '0',
                      icon: Icons.history_edu,
                      iconColor: Colors.green,
                      onTap: () =>Get.to(()=>const MenuScreen()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )


*/