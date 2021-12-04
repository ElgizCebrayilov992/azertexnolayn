import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_color.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_center_text.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_radio_button.dart';
import 'package:flutter/widgets.dart';
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
    print('SS ${controller.select}');
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
                    ],
                  ),
                ),
              ),
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
                Wrap(
                  children: const [
                    CustomerRadioButton(index: 0),
                    CustomerRadioButton(index: 1),
                    CustomerRadioButton(index: 2),
                    CustomerRadioButton(index: 3),
                    CustomerRadioButton(index: 4),
                  ],
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