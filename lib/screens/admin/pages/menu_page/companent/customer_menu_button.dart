import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerMenuButton extends StatelessWidget {
  const CustomerMenuButton({Key? key, required this.child, required this.title})
      : super(key: key);
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Get.to(child),
        child:  SizedBox(
          width: double.infinity,
          child: Card(
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
