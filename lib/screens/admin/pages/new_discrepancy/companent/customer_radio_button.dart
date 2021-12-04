import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../new_discrepancy_controller.dart';

class CustomerRadioButton extends GetView<NewDiscrepancyController> {
  const CustomerRadioButton( {required this.index, Key? key}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GetBuilder<NewDiscrepancyController>(
        
        builder: (controller) => RadioListTile(
          dense: true,
          activeColor: Colors.green,
          value: controller.findings[index],
          groupValue: controller.select,
          title: Text(controller.findings[index]),
          onChanged: (value) {
            controller.onClickRadioButton(value);
          },
        ),
      ),
    );
  }
}
