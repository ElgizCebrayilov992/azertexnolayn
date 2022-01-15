import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/profil/companent/customer_text_and_texfiled.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  ProfilScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController(text: 'ad');
  final TextEditingController surname = TextEditingController(text: 'Soyad');
  final TextEditingController mail = TextEditingController(text: 'Mail');
  final TextEditingController phone = TextEditingController(text: 'Phone');
  final TextEditingController password =
      TextEditingController(text: 'Password');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstantsText.profil),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomerTextAndTextField(
                controller: name, title: AppConstantsText.name),
            CustomerTextAndTextField(
                controller: surname, title: AppConstantsText.surname),
            CustomerTextAndTextField(
                controller: mail, title: AppConstantsText.mail),
            CustomerTextAndTextField(
                controller: phone, title: AppConstantsText.phone),
            CustomerTextAndTextField(
                controller: password, title: AppConstantsText.password),
            Row(
              children: [
                CustomerButton(
                  title: AppConstantsText.update,
                  color: Colors.green,
                  onPressed: () {
                    print(name.text);
                  },
                ),
                CustomerButton(
                  title: AppConstantsText.cancell,
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
