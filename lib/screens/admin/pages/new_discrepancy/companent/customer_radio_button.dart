import 'package:azertexnolayn/core/model/finding/finding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../new_discrepancy_controller.dart';
/*
class CustomerRadioButton extends GetView<NewDiscrepancyController> {
  const CustomerRadioButton({ Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GetBuilder<NewDiscrepancyController>(
        builder: (controller) => RadioListTile<FindingModel>(
          dense: true,
          activeColor: Colors.green,
          value: controller.findingModel!,
          groupValue: controller.findingModel,
          title: Text(controller.findingModel!.name!),
          onChanged: (value) {
            controller.setFinding(value);
          },
        ),
      ),
    );
  }
}
*/
class CustomerRadioButton1 extends StatelessWidget {
  const CustomerRadioButton1(
      {required this.index,
      Key? key,
      required this.value,
      required this.grouoValue,
      required this.onChanged,
      required this.width})
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
