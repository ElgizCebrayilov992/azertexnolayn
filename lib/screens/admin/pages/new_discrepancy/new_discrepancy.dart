import 'dart:io';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_color.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_center_text.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_radio_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/response/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import '../../global_companent/global_companent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';
import 'package:kartal/kartal.dart';

import 'companent/custom_text_form_field.dart';
import 'companent/customer_card.dart';
import 'new_discrepancy_controller.dart';

// ignore: must_be_immutable
class NewDiscrepancy extends GetView<NewDiscrepancyController> {
  TextEditingController controllerTitile = TextEditingController();
  TextEditingController controllerStandart = TextEditingController();
  // ignore: unused_field
  final TextEditingController _textEditingController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  NewDiscrepancy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
    return Scaffold(
      appBar: appBarSection(context),
      body: ResponsiveLayout.isTinyLimit(context)
          ? Container()
          : SingleChildScrollView(
              child: Padding(
                padding: context.paddingNormal,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dateAndWho(),
                      buildDropdownButton(),
                      CustomertextFormField(
                        title: 'Xəta başlığı',
                        inputType: TextInputType.multiline,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length <= 3) {
                            return "Ən az 3 hərf olmalıdır";
                          } else {
                            return null;
                          }
                        },
                        controller: controllerTitile,
                      ),
                      const Divider(color: AppConstantsColor.compColorWhite),
                      const CustomerCenterText(
                        title: AppConstantsText.descriptionOfFinding,
                      ),

                      buildDescriptionOfFinding(context),
                      const Divider(color: AppConstantsColor.compColorWhite),
                      //KÖK SƏBƏB ANALİZİ
                      const CustomerCenterText(
                        title: AppConstantsText.rootCauseAnalysis,
                      ),
                      buildRoot(),
                      const Divider(color: AppConstantsColor.compColorWhite),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppConstantsColor.purpleDark,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  AppConstantsText.imagesDownload,
                                  style: TextStyle(
                                      color: AppConstantsColor.compColorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GetBuilder<NewDiscrepancyController>(
                              builder: (controller) {
                                if (controller.imageList.isEmpty) {
                                  return Center(
                                    child: TextButton(
                                        onPressed: () {
                                          controller.uploadImage();
                                          /*
                                          var picked = await FilePicker.platform
                                              .pickFiles();
                                          if (picked != null) {
                                            print(picked.files.first.name);
                                            print(picked.files.first.path);
                                          }
                                        
                                        */
                                        },
                                        child: const Text(
                                            AppConstantsText.imagesButtonText)),
                                  );
                                } else {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     SizedBox(
                                       height: context.dynamicHeight(0.22),
                                       width: double.infinity,
                                       child: ListView.builder(
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (context, index) {
                                         return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.file(
                                                      File(controller.imageList[index].path),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ),
                                                    onPressed: () {

                                                      controller.deleteImage(index);
                                                    },
                                                    child: const SizedBox(
                                                   
                                                    width: 50,
                                                      child: Center(
                                                          child: Text('Sil')),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                       },itemCount: controller.imageList.length,),
                                     ),
                                      TextButton(
                                          onPressed: () {
                                            controller.uploadImage();
                                            /*
                                          var picked = await FilePicker.platform
                                              .pickFiles();
                                          if (picked != null) {
                                            print(picked.files.first.name);
                                            print(picked.files.first.path);
                                          }
                                        
                                        */
                                          },
                                          child: const Text(AppConstantsText
                                              .imagesButtonText)),
                                    ],
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Card buildRoot() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppConstantsColor.purpleDark,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                AppConstantsText.required,
                style: TextStyle(
                    color: AppConstantsColor.compColorWhite,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GetBuilder<NewDiscrepancyController>(
            builder: (controller) => Wrap(
              runSpacing: -10,
              spacing: 10,
              children: [
                CustomerRadioButton1(
                  width: 120,
                  index: 0,
                  grouoValue: controller.selectRoot,
                  onChanged: (value) =>
                      controller.onClickRadioButtonRoot(value),
                  value: controller.findingsRoot[0],
                ),
                CustomerRadioButton1(
                  width: 120,
                  index: 0,
                  grouoValue: controller.selectRoot,
                  onChanged: (value) =>
                      controller.onClickRadioButtonRoot(value),
                  value: controller.findingsRoot[1],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card buildDescriptionOfFinding(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<NewDiscrepancyController>(
                  builder: (controller) => Wrap(
                    children: [
                      CustomerRadioButton1(
                        width: 250,
                        index: 0,
                        grouoValue: controller.select,
                        onChanged: (value) =>
                            controller.onClickRadioButtonFinding(value),
                        value: controller.findings[0],
                      ),
                      CustomerRadioButton1(
                        width: 250,
                        index: 0,
                        grouoValue: controller.select,
                        onChanged: (value) =>
                            controller.onClickRadioButtonFinding(value),
                        value: controller.findings[1],
                      ),
                      CustomerRadioButton1(
                        width: 250,
                        index: 0,
                        grouoValue: controller.select,
                        onChanged: (value) =>
                            controller.onClickRadioButtonFinding(value),
                        value: controller.findings[2],
                      ),
                      CustomerRadioButton1(
                        width: 250,
                        index: 0,
                        grouoValue: controller.select,
                        onChanged: (value) =>
                            controller.onClickRadioButtonFinding(value),
                        value: controller.findings[3],
                      ),
                      CustomerRadioButton1(
                        width: 250,
                        index: 0,
                        grouoValue: controller.select,
                        onChanged: (value) =>
                            controller.onClickRadioButtonFinding(value),
                        value: controller.findings[4],
                      ),
                    ],
                  ),
                ),
                CustomertextFormField(
                    title: AppConstantsText.standardClauseTitle,
                    inputType: TextInputType.multiline,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length <= 3) {
                        return "Ən az 3 hərf olmalıdır";
                      } else {
                        return null;
                      }
                    },
                    controller: controllerStandart),
                CustomertextFormField(
                    title: AppConstantsText.standardClause,
                    inputType: TextInputType.multiline,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length <= 3) {
                        return "Ən az 3 hərf olmalıdır";
                      } else {
                        return null;
                      }
                    },
                    controller: controllerStandart),
              ],
            ),
            flex: ResponsiveLayout.isPhone(context) ? 1 : 3,
          ),
        ],
      ),
    );
  }

  Wrap buildDropdownButton() {
    return Wrap(
      spacing: 10,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adiyyatı',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GetBuilder<NewDiscrepancyController>(
                  builder: (controller) => DropdownButton(
                      menuMaxHeight: 120.0,
                      isDense: true,
                      hint: const Text('Adiyyatı'),
                      dropdownColor: Colors.white,
                      onChanged: (value) => controller.setRaised(value),
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
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bölmə',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GetBuilder<NewDiscrepancyController>(
                  builder: (controller) => DropdownButton(
                      menuMaxHeight: 120.0,
                      isDense: true,
                      dropdownColor: Colors.white,
                      onChanged: (value) => controller.setSection(value),
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
                const Text(
                  'Sahə',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GetBuilder<NewDiscrepancyController>(
                  builder: (controller) => DropdownButton(
                      isDense: true,
                      menuMaxHeight: 120.0,
                      dropdownColor: Colors.white,
                      onChanged: (value) => controller.setArea(value),
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
    return Wrap(
      children: [
        CustomerCard(
            title: 'Tarix/Date',
            info: formatDate(
              DateTime.now(),
              [dd, '.', mm, '.', yyyy],
            )),
        const CustomerCard(
            title: 'Aşkralayan/Initiator', info: 'Elgiz Cebrayilov'),
      ],
    );
  }
}
/*
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
                 


 */