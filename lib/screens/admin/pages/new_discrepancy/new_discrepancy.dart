import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:aztex_repair/screens/admin/pages/new_discrepancy/companent/customer_card.dart';
import 'package:aztex_repair/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:flutter/cupertino.dart';
import '../../global_companent/global_companent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';
import 'package:kartal/kartal.dart';

import 'companent/custom_text_form_field.dart';

// ignore: must_be_immutable
class NewDiscrepancy extends GetView<NewDiscrepancyController> {
  TextEditingController controllerCompanyName = TextEditingController();
  // ignore: unused_field
  TextEditingController _textEditingController2 = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // print(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
    return Scaffold(
      appBar: appBarSection(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateAndWho(),
                buildDropdownButton(),
                Row(
                  children: [
                    CustomertextFormField(
                      title: 'Xəta başlığı',
                      inputType: TextInputType.multiline,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 3) {
                          return "Ən az 3 hərf olmalıdır";
                        } else {
                          return null;
                        }
                      },
                      controller: controllerCompanyName,
                    ),
                    CustomertextFormField(
                      title: 'Xəta başlığı',
                      inputType: TextInputType.text,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length <= 3) {
                          return "Ən az 3 hərf olmalıdır";
                        } else {
                          return null;
                        }
                      },
                      controller: controllerCompanyName,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Wrap buildDropdownButton() {
    return Wrap(
                spacing: 10,
                children: [
                  Card(
                    //   color: Colors.white,
          
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adiyyatı/Raised to',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<NewDiscrepancyController>(
                            builder: (controller) => DropdownButton(
                                alignment: Alignment.topLeft,
                                isDense: true,
                                borderRadius: BorderRadius.circular(20),
                                hint: Text('Adiyyatı/Applies to'),
                                dropdownColor: Colors.white,
                                onChanged: (value) =>
                                    controller.setRaised(value),
                                value: controller.selectRaised,
                                items: controller.listRaised
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: AutoSizeText(
                                          e,
                                          minFontSize: 8,
                                        ),
                                        value: e,
                                      ),
                                    )
                                    .toList()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tətbiq olunacaq / Applies to:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<NewDiscrepancyController>(
                            builder: (controller) => DropdownButton(
                                alignment: Alignment.topLeft,
                                isDense: true,
                                borderRadius: BorderRadius.circular(20),
                                hint: Text('Adiyyatı/Applies to'),
                                dropdownColor: Colors.white,
                                onChanged: (value) =>
                                    controller.setApplies(value),
                                value: controller.selectApplies,
                                items: controller.listApplies
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: AutoSizeText(
                                          e,
                                          minFontSize: 10,
                                        ),
                                        value: e,
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ),
                    ),
                  ),
                  */
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bölmə / Section',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<NewDiscrepancyController>(
                            builder: (controller) => DropdownButton(
                                alignment: Alignment.topLeft,
                                isDense: true,
                                borderRadius: BorderRadius.circular(20),
                             
                                dropdownColor: Colors.white,
                                onChanged: (value) =>
                                    controller.setSection(value),
                                value: controller.selectSection,
                                items: controller.listSection
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: AutoSizeText(
                                          e,
                                          minFontSize: 10,
                                        ),
                                        value: e,
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sahə / Area',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<NewDiscrepancyController>(
                            builder: (controller) => DropdownButton(
                                alignment: Alignment.topLeft,
                                isDense: true,
                                borderRadius: BorderRadius.circular(20),
                                hint: Text('Adiyyatı/Applies to'),
                                dropdownColor: Colors.white,
                                onChanged: (value) =>
                                    controller.setArea(value),
                                value: controller.selectArea,
                                items: controller.listArea
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: AutoSizeText(
                                          e,
                                          minFontSize: 10,
                                        ),
                                        value: e,
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
  }

  Widget dateAndWho() {
    return IntrinsicWidth(
     
      child: Wrap(
        children: [
          CustomerCard(
              title: 'Tarix/Date',
              info: '${formatDate(
                DateTime.now(),
                [dd, '.', mm, '.', yyyy],
              )}'),
          CustomerCard(title: 'Aşkralayan/Initiator', info: 'Elgiz Cebrayilov'),
        ],
      ),
    );
  }
}
