import 'document_builder_controller.dart';
import '../document_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentScreen extends GetView<DocumentController> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DocumentController>(builder: (controller) => ListView.builder(
    scrollDirection: Axis.vertical,
    controller: ScrollController(),
      itemBuilder: (context, index) => DocumentWidget(controller.list![index]),
      itemCount: controller.list?.length,
    ),);
  }
}
