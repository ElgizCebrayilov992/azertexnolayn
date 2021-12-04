import 'package:azertexnolayn/core/constants/constants_color.dart';
import 'package:flutter/material.dart';

class CustomerCenterText extends StatelessWidget {
  const CustomerCenterText({Key? key,required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return   Center(
                        child:  Text(
                          title,
                          style: const TextStyle(
                              color: AppConstantsColor.compColorWhite,
                              fontWeight: FontWeight.bold),
                        ));
  }
}