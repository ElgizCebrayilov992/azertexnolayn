import 'package:azertexnolayn/screens/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  final String mesaj;
  const ErrorPage({Key? key, required this.mesaj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              Expanded(child: SingleChildScrollView(child: Center(child: Text(mesaj)))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Serveri tapa bilmədi.Serveri dəyiş=>'),
                        ElevatedButton(onPressed: () {
                          Get.off(()=>RegistrationPage());
                        }, child: const Text('Dəyiş'))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
