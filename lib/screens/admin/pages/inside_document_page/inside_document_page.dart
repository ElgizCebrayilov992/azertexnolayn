
import '../../../../core/constants/constants_color.dart';

import '../../../../core/constants/constants_text.dart';
import '../../../../core/response/responsive_layout.dart';
import '../../global_companent/global_companent.dart';
import '../admin_page/companent/app_bar_widget.dart';
import 'companent/one_expansion/header_left_logo.dart';
import 'companent/two_expansion/type_of_disc.dart';
import 'inside_document_page_controller.dart';
import '../../../../test/image_list/image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import 'companent/one_expansion/header_applies.dart';
import 'companent/one_expansion/header_right_info.dart';
import 'companent/one_expansion/header_time_name.dart';
import 'companent/one_expansion/header_title.dart';
import 'companent/one_expansion/header_whom.dart';
import 'companent/two_expansion/card_text.dart';
import 'companent/two_expansion/customer_image.dart';
import 'companent/two_string_with_row_and_expanded.dart';

class InsideDocumentPage extends GetView<InsideDocumentPageController> {
  @override
  Widget build(BuildContext context) {
    int a = 2;
    return Scaffold(
      appBar: appBarSection(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              oneExpansionTileForComputer(context),
              const SizedBox(
                height: 10,
              ),
              twoExpansionTileForComputer(context),
              const SizedBox(
                height: 10,
              ),
              threeExpansionTileForComputer(),
              const SizedBox(
                height: 10,
              ),
              fourExpansionTileForComputer(a, context)
            ],
          ),
        ),
      ),
    );
  }

  Container fourExpansionTileForComputer(int a, BuildContext context) {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: ExpansionTile(
        title: const Text(
            'DÜZƏLTMƏ / DÜZƏLDİCİ TƏDBİR / CORRECTION / CORRECTIVE  ACTION'),
        children: [
          SizedBox(
            width: context.dynamicWidth(0.95),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              children: [
                CardText(
                    title: 'Növü / Type',
                    info: 'DÜZƏLTMƏ / CORRECTION',
                    mainAxisSize: MainAxisSize.min),
                CardText(
                    title: 'TƏYİN OLUNAN ŞƏXS\nASSIGNED PERSON',
                    info: 'Vefadar Babayev',
                    mainAxisSize: MainAxisSize.min),
                CardText(
                    title: 'HƏDƏF BİTMƏ TARİXİ\nTARGET COMP. DATE',
                    info: '07.05.2021 16:00',
                    mainAxisSize: MainAxisSize.min),
                CardText(
                    title: 'BİTMƏ TARİXİ\nCOMPLETION DATE',
                    info: '06.05.2021 16:00',
                    mainAxisSize: MainAxisSize.min),
              ],
            ),
          ),
          const Divider(),
          const TwoStringWithRowAndExpanded(
              title:
                  '(ƏGƏR KÖK SƏBƏB ANALİZİ TƏLƏB OLUNURSA / IF RCA REQUIRED)',
              info: AppConstantsText.example2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TwoStringWithRowAndExpanded(
                title: 'DT Qəbul olundu\nCA Accepted:',
                info: a == 1 ? 'Yes' : AppConstantsText.example2),
          ),
          //'DT Qəbul olundu\nCA Accepted:'
        ],
      ),
    );
  }

  Container threeExpansionTileForComputer() {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: const ExpansionTile(
        title: Text('KÖK SƏBƏB ANALİZİ / ROOT CAUSE ANALYSIS (RCA)'),
        children: [
          TwoStringWithRowAndExpanded(
              title: 'Tələb olunur? \nRequired?', info: 'yes'),
          TwoStringWithRowAndExpanded(
              title: 'Səbəblər/Causes',
              info: 'AVADANLIQ XƏTASI / EQUIPMENT FAILURE'),
          Divider(),
          TwoStringWithRowAndExpanded(
              title: 'digər / other:', info: AppConstantsText.example2),
          Divider(),
          TwoStringWithRowAndExpanded(
              title:
                  'Kök səbəb analiz komanda üzvləri\nRoot Cause Analyse Team members:',
              info: AppConstantsText.exampleAdamlar),
        ],
      ),
    );
  }

  Container twoExpansionTileForComputer(BuildContext context) {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: ExpansionTile(
        title: const Text('TAPINTININ AÇIQLAMASI / DESCRIPTION OF FINDING'),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TypeOfDiscovery(),
              const Divider(),
              const TwoStringWithRowAndExpanded(
                  title: 'Əlavə açıqlama/Additional disclosure',
                  info: AppConstantsText.example),
              const Divider(),
              const TwoStringWithRowAndExpanded(
                title: 'Standart və Maddə № \n Standard & Clause#',
              ),
              Container(
                padding: const EdgeInsets.all(9),
                width: double.infinity,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: ImageList.imageList()
                      .map(
                        (e) => CustomerImage(e: e),
                      )
                      .toList(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container oneExpansionTileForComputer(BuildContext context) {
    return Container(
      color: AppConstantsColor.compColorWhite,
      child: ExpansionTile(
        onExpansionChanged: (value) => controller.changeHeaderChek(),
        initiallyExpanded: controller.oneCheck,
        title: GetBuilder<InsideDocumentPageController>(
          builder: (controller) =>
              controller.oneCheck ? const Text('') : const HeaderTitle(),
        ),
        children: [
          SizedBox(
            width: context.dynamicWidth(0.95),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const [
                 HeaderLeftLogo(),
                 HeaderTitle(),
                 HeaderRightInfo(),
              ],
            ),
          ),
          divider(),
          Row(
            children: [
              const HeaderTimeAndName(
                bolme: "Ilk Goz",
                name: 'Elgiz',
                time: '21.05.2021',
              ),
              const HeaderWhom(raised: 'Daxili sobe'),
              const Applies(applies: "SİSTEM / SYSTEM")
            ],
          )
        ],
      ),
    );
  }
//' SİSTEM / SYSTEM'

 

  PreferredSize appBarSection(BuildContext context) {
    return PreferredSize(
      child: (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context))
          ? Container()
          : const AppBarWidget(index: 1),
      preferredSize: const Size(double.infinity, 100),
    );
  }

  rowTwoString({
    required String title,
    required String info,
    TextStyle? titleStyle,
    TextStyle? titleInfo,
    double? titleOnSize = 20,
    double? infoOnSize = 10,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) =>
      Row(
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              info,
              style: titleInfo,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      );
}
/*

Container(
                              width: 108,
                              child: a == 2
                                  ? GetBuilder<InsideDocumentPageController>(
                                      builder: (controller) =>
                                          SimpleGroupedCheckbox<String>(
                                        groupTitleAlignment:
                                            Alignment.centerLeft,
                                        onItemSelected: (selected) {
                                          controller.changeAccept(selected);
                                        },
                                        controller: controller.controller,
                                        itemsTitle: ["Yes", "No"],
                                        values: ['yes', 'no'],
                                        checkFirstElement: false,
                                        isLeading: true,
                                      ),
                                    )
                                  : Text('Yes'),
                            )

**************************************
 GetBuilder<InsideDocumentPageController>(
                        builder: (controller) {
                          return controller.accept == 'yes'
                              ? Text('')
                              : Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Əgər YOX, Səbəb göstər\nIf NO, Provide reason:'),
                                    Container(
                                      width: context.dynamicWidth(0.8),
                                      child: AutoSizeTextField(
                                        onChanged: (value) => print(value),
                                        controller: controller
                                            .textEditingControllerOne,
                                        minFontSize: 24,
                                        maxLines: 6,
                                      ),
                                    ),
                                  ],
                                );
                        },
                      )
*/