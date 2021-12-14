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
            controller.onClickRadioButtonFinding(value);
          },
        ),
      ),
    );
  }
}



class CustomerRadioButton1 extends StatelessWidget {
  const CustomerRadioButton1(
      {required this.index,
      Key? key,
      required this.value,
      required this.grouoValue,
      required this.onChanged,required this.width})
      : super(key: key);
  final int index;
  final double width;
  final String value;
  final String grouoValue;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RadioListTile(

        dense: true,
        activeColor: Colors.green,
        value: value,
        groupValue: grouoValue,
        title: Text(value),
        onChanged: onChanged,
      ),
    );
  }
}


