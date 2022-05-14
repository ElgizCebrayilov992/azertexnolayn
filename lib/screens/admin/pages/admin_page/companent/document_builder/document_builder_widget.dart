import 'document_builder_controller.dart';
import '../document_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/inconsistency/inconsistency_model.dart';
class DocumentScreen extends GetView<DocumentController> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DocumentController>(builder: (controller) => ListView.builder(
    scrollDirection: Axis.vertical,
    controller: ScrollController(),
      itemBuilder: (context, index) => DocumentWidget(InconsistencyModel()),
      itemCount: controller.list?.length,
    ),);
  }
}
