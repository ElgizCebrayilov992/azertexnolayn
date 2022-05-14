import 'dart:io';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_color.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/core/model/applies/applies_model.dart';
import 'package:azertexnolayn/core/model/finding/finding_model.dart';
import 'package:azertexnolayn/core/model/raised/raised_model.dart';
import 'package:azertexnolayn/core/model/undersection/undersection_model.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/position/position_screen.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_button.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_center_text.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_chip.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_radio_button.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
import 'package:azertexnolayn/core/model/section/section_model.dart';

// ignore: must_be_immutable
class NewDiscrepancy extends GetView<NewDiscrepancyController> {
  TextEditingController controllerTitile = TextEditingController();
  TextEditingController controllerStandart = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  UserController userController = Get.find<UserController>();
  NewDiscrepancyController newController = Get.find<NewDiscrepancyController>()
    ..getUser();
  final _formKey = GlobalKey<FormState>();
  late String createDate;
  late String root='1';

  NewDiscrepancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createDate = getDate();
    // print(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
    return Scaffold(
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
                      buildDivider(),
                      buildDropdownButton(),

                      buildDivider(),

                      const CustomerCenterText(
                        title: AppConstantsText.descriptionOfFinding,
                      ),

                      buildDescriptionOfFinding(context),
                      buildDivider(),
                      //KÖK SƏBƏB ANALİZİ
                      const CustomerCenterText(
                        title: AppConstantsText.rootCauseAnalysis,
                      ),
                      buildRoot(),
                      buildDivider(),
                      buildLoadingImages(context),
                      buildSendAndCancellBUtton()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<String?> buidlAddPersonDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: controller.results.isEmpty
            ? const Text('')
            : const Text('Əlavə et'),
        content: controller.results.isEmpty
            ? const Text('Daxil edəcəyiniz istifadəçilər bitmişdir')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomerSearchTextField(
                    onChanged: (value) {
                      controller.runFilter(enteredKeyword: value);
                    },
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    height: context.dynamicHeight(0.2),
                    child: SingleChildScrollView(
                      child: GetBuilder<NewDiscrepancyController>(
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.results
                                .map((e) => TextButton(
                                    onPressed: () {
                                      controller.addUser(e);
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: Text(e.name!)))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
    /*
    Container(
                  height: 200,
                  width: context.dynamicWidth(0.09),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.userModelListTest.length,
                    itemBuilder: (context, index) {
                      return Text(controller.userModelListTest[index].name);
                    },
                  ),
                )
    */
  }

  Divider buildDivider() =>
      const Divider(color: AppConstantsColor.compColorWhite);

  Row buildSendAndCancellBUtton() {
    return Row(
      children: [
        CustomerButton(
          title: AppConstantsText.send,
          color: Colors.green,
          onPressed: () async {
        
        
            await newController.createWriter(
             
                create_date: getDate(),
                section_id: newController.sectionModel!.id!,
                under_section_id: newController.underModel!.id!,
                create_user_id: userController.model.id!,
                finding_id: newController.findingModel!.id!,
                finding_desc: controllerDescription.text,
                clause: controllerStandart.text.isEmpty?"gözləyir":controllerStandart.text,
                root: root,
                counter: '1',
                counter_end_date: getCounterDate(),
                situation: '1',
                status: '0',);
             
              Get.back();
          },
        ),
        CustomerButton(
          title: AppConstantsText.cancell,
          color: Colors.red,
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }

  Card buildLoadingImages(BuildContext context) {
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
                      child: const Text(AppConstantsText.imagesButtonText)),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {
                                    controller.deleteImage(index);
                                  },
                                  child: const SizedBox(
                                    width: 50,
                                    child: Center(child: Text('Sil')),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: controller.imageList.length,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.uploadImage();
                        },
                        child: const Text(AppConstantsText.imagesButtonText)),
                  ],
                );
              }
            },
          )
        ],
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
                  onChanged: (value) {
                    root = '0';
                    controller.onClickRadioButtonRoot(value);
                  },
                  value: controller.findingsRoot[0],
                ),
                CustomerRadioButton1(
                  width: 120,
                  index: 0,
                  grouoValue: controller.selectRoot,
                  onChanged: (value) {
                    root = '1';
                    controller.onClickRadioButtonRoot(value);
                  },
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
                    children: controller.findingList
                        .map(
                          (e) => SizedBox(
                            width: 250,
                            child: RadioListTile<FindingModel>(
                              dense: true,
                              activeColor: Colors.green,
                              value: e,
                              groupValue: controller.findingModel,
                              title: Text(e.name!),
                              onChanged: (value) =>
                                  controller.setFinding(value),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                /*

                */
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
                    controller: controllerDescription),
                CustomertextFormField(
                    title: AppConstantsText.standardClause,
                    inputType: TextInputType.multiline,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {},
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
                  'Bölmə',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GetBuilder<NewDiscrepancyController>(
                  builder: (controller) => DropdownButton<SectionModel>(
                      //  menuMaxHeight: 120.0,
                      isDense: true,
                      dropdownColor: Colors.white,
                      onChanged: (value) => controller.setSection(value),
                      value: controller.sectionModel,
                      items: controller.sectionList
                          .map(
                            (e) => DropdownMenuItem<SectionModel>(
                              child: AutoSizeText(
                                e.name ?? "",
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
        GetBuilder<NewDiscrepancyController>(
          builder: (controller) {
            if (newController.underModel?.name == null) {
              return const SizedBox();
            } else {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sahə',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<UndersectionModel>(
                          isDense: true,
                          //   menuMaxHeight: 120.0,
                          dropdownColor: Colors.white,
                          onChanged: (value) =>
                              controller.setUnderSection(value),
                          value: controller.underModel,
                          items: controller.underList
                              .map(
                                (e) => DropdownMenuItem<UndersectionModel>(
                                  child: AutoSizeText(
                                    e.name ?? "",
                                    minFontSize: 10,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList()),
                    ],
                  ),
                ),
              );
            }
          },
        ),

        //
      ],
    );
  }

  Widget dateAndWho() {
    return Wrap(
      children: [
        CustomerCard(title: 'Tarix/Date', info: getDate()),
        CustomerCard(
          title: 'Aşkralayan/Initiator',
          info: userController.model.name,
        ),
      ],
    );
  }

  String getDate() {
    return  DateTime.now().toString();
    
    /*
     formatDate(
      
     ,
      [mm,':',hh,' ',dd, '.', mm, '.', yyyy],
    );
    */
  }

  String getCounterDate() {
    int day = DateTime.now().day + 1;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    int hour=DateTime.now().hour;
    int minute=DateTime.now().minute;
    int sec=DateTime.now().second;
    
    return formatDate(
      DateTime(year, month, day,hour,minute,sec),
      [ yyyy,'-',mm,'-',dd,' ',HH,':',mm,":",ss],
    );
  }
}
/*

  
 /*
                 
                  */
                 


 */