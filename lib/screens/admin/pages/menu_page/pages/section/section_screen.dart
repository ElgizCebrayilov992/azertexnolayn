import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/section_up_and_under/section_up_and_under.dart';
import 'package:azertexnolayn/core/model/undersection/undersection_model.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/section/section_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import 'package:azertexnolayn/core/model/section/section_model.dart';

class SectionScreen extends GetView<SectionController> {
  SectionScreen({Key? key}) : super(key: key);

  SectionModel model = SectionModel();

  UndersectionModel underModel = UndersectionModel();

  TextEditingController sectionName = TextEditingController();

  TextEditingController unSectionName = TextEditingController();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
  print("1");
    controller.fetchAllSection();
    controller.fetchAllUnSection();
    controller.fetchAllUnAndUpSection();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            appBarButton(context),
          ],
          centerTitle: true,
          title: const Text(AppConstantsText.section),
          bottom: TabBar(
            onTap: (value) {
              _index = value;
              controller.setChange(_index);
            },
            tabs: const [
              Tab(
                text: AppConstantsText.upSection,
              ),
              Tab(
                text: AppConstantsText.underSection,
              ),
              Tab(
                text: AppConstantsText.combineSection,
              ),
            ],
          ),
        ),
        body: Card(
          child: TabBarView(
            children: [
              sectionView(context),
              unSectionView(context),
              unAndUpSectionView(context)
            ],
          ),
        ),
      ),
    );
  }

  IconButton appBarButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (_index == 0) {
          _showUpAndUnderDialog(
              context, AppConstantsText.upSection, 'Əlavə et', 1, _index);
        } else if (_index == 1) {
          _showUpAndUnderDialog(
              context, AppConstantsText.underSection, 'Əlavə et', 1, _index);
        } else {
          controller.searchSection();
          controller.searchUnSectionList();
          _showUpAndUnderDialog(
              context, AppConstantsText.combineSection, 'Əlavə et', 1, _index);
        }
      },
      icon: const Icon(Icons.add),
    );
  }

  sectionView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomerSearchTextField(
            onChanged: (value) {
              controller.sectionSearch(text: value);
            },
          ),
          const Divider(),
          GetBuilder<SectionController>(builder: (controller) {
            int a = 1;
            //  print(controller.models.length);
            if (controller.loading == Loading.EMPTY) {
              return const Center(
                child: Text('Bazada məlumat yoxdur'),
              );
            } else if (controller.loading == Loading.DONE) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: context.dynamicWidth(1),
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('Ad'),
                          ),
                          DataColumn(
                            label: Text(' '),
                          ),
                        ],
                        rows: controller.models
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text((a++).toString())),
                                  DataCell(Text(e.name!)),
                                  DataCell(Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.sectionVisible('1', e.id);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          sectionName = TextEditingController(
                                              text: e.name);
                                          _showUpAndUnderDialog(context,
                                              'Məlumatı dəyiş', 'Dəyiş', 2, 0,
                                              id: e.id);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              );
            } else if (controller.loading == Loading.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Əlaqə qurulmadı'),
              );
            }
          })
        ],
      ),
    );
  }

  Future<void> _showUpAndUnderDialog(
      BuildContext context, String title, buttonText, int count, index,
      {String? id}) async {
    return index == 2
        ? showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: SingleChildScrollView(
                  child: GetBuilder<SectionController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Üst bölmə',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: DropdownButtonHideUnderline(
                                  child: DropdownButton<SectionModel>(
                                    isDense: true,
                                    dropdownColor: Colors.white,
                                    value: controller.model,
                                    onChanged: (newValue) {
                                      controller.setSection(newValue!);
                                    },
                                    items: controller.models.map((item) {
                                      return DropdownMenuItem<SectionModel>(
                                        child: Text(item.name!),
                                        value: item,
                                      );
                                    }).toList(),
                                  ),
                                )),
                              ],
                            ),
                            const Divider(),
                            const Text(
                              'Alt bölmə',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: DropdownButtonHideUnderline(
                                  child: DropdownButton<UndersectionModel>(
                                    isDense: true,
                                    dropdownColor: Colors.white,
                                    value: controller.underModel,
                                    onChanged: (newValue) {
                                      controller.setUnSection(newValue!);
                                    },
                                    items: controller.unModels.map((item) {
                                      return DropdownMenuItem<
                                          UndersectionModel>(
                                        child: Text(item.name!),
                                        value: item,
                                      );
                                    }).toList(),
                                  ),
                                )),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                actions: buildDialogButtons(context, buttonText, count, index,
                    id: id),
              );
            },
          )
        : showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      CustomerTextField(
                          title: 'Ad:',
                          hintText: 'Məsələn: Məhsul',
                          controller:
                              _index == 0 ? sectionName : unSectionName),
                    ],
                  ),
                ),
                actions: buildDialogButtons(context, buttonText, count, index,
                    id: id),
              );
            },
          );
  }

  Future<void> _loadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
          content: SizedBox(
            child: Text('Salam'),
            width: 50,
            height: 50,
          ),
        );
      },
    );
  }

  List<Widget> buildDialogButtons(
      BuildContext context, String buttonText, int count, index,
      {String? id}) {
    return <Widget>[
      TextButton(
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.green),
        ),
        onPressed: () {
          if (count == 1) {
            if (index == 0) {
              controller.sectionAdd(sectionName.text);
            } else if (index == 1) {
              controller.unSectionAdd(unSectionName.text);
            } else {
              controller.unAndUpSectionAdd(controller.model.id.toString(),
                  controller.underModel.id.toString());
            }
            //
          } else {
            if (index == 0) {
              controller.sectionUpdate(sectionName.text, id);
            } else if (index == 1) {
              controller.unSectionUpdate(unSectionName.text, id);
            } else {
              controller.unAndUpSectionUpdate(controller.model.id.toString(),
                  controller.underModel.id.toString(), id);
            }
            //    controller.causesUpdate(name.text, id);
          }
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        child: const Text(
          'Ləğv et',
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
  }

  unSectionView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomerSearchTextField(
            onChanged: (value) {
              controller.unSectionSearch(text: value);
            },
          ),
          const Divider(),
          GetBuilder<SectionController>(builder: (controller) {
            int a = 1;
            //  print(controller.models.length);
            if (controller.unLoading == Loading.EMPTY) {
              return const Center(
                child: Text('Bazada məlumat yoxdur'),
              );
            } else if (controller.unLoading == Loading.DONE) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: context.dynamicWidth(1),
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('Ad'),
                          ),
                          DataColumn(
                            label: Text(' '),
                          ),
                        ],
                        rows: controller.unModels
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text((a++).toString())),
                                  DataCell(Text(e.name!)),
                                  DataCell(Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.unSectionVisible(
                                              '1', e.id);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          unSectionName = TextEditingController(
                                              text: e.name);

                                          _showUpAndUnderDialog(context,
                                              'Məlumatı dəyiş', 'Dəyiş', 2, 1,
                                              id: e.id);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              );
            } else if (controller.loading == Loading.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Əlaqə qurulmadı'),
              );
            }
          })
        ],
      ),
    );
  }

  unAndUpSectionView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomerSearchTextField(
            onChanged: (value) {
              controller.unAndUpSectionSearch(text: value);
            },
          ),
          const Divider(),
          GetBuilder<SectionController>(builder: (controller) {
            int a = 1;
            //  print(controller.models.length);
            if (controller.upAndUnderLoading == Loading.EMPTY) {
              return const Center(
                child: Text('Bazada məlumat yoxdur'),
              );
            } else if (controller.upAndUnderLoading == Loading.DONE) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: context.dynamicWidth(1),
                      child:GetPlatform.isMobile ?FittedBox(
                       
                        child: table(controller, a, context),
                      ):table(controller, a, context),
                    ),
                  ),
                ),
              );
            } else if (controller.upAndUnderLoading == Loading.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Əlaqə qurulmadı'),
              );
            }
          })
        ],
      ),
    );
  }

  DataTable table(SectionController controller, int a, BuildContext context) {
    return DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Flexible(child: Text('Üst bölmə')),
                          ),
                          DataColumn(
                            label: Flexible(child: Text('Alt bölmə')),
                          ),
                          DataColumn(
                            label: Text(''),
                          ),
                        ],
                        rows: controller.unAndUpModels
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text((a++).toString())),
                                  DataCell(Text(e.section_name!)),
                                  DataCell(Text(e.undersection_name!)),
                                  DataCell(Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.unAndUpSectionVisible(
                                              '1', e.id);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.searchSection(
                                              sectionId:
                                                  e.section_id.toString());
                                          controller.searchUnSectionList(
                                              unSectionId:
                                                  e.undersection_id.toString());
                    
                                          controller.model.id!.isEmpty
                                              ? _loadingDialog(context)
                                              : _showUpAndUnderDialog(
                                                  context,
                                                  'Məlumatı dəyiş',
                                                  'Dəyiş',
                                                  2,
                                                  2,
                                                  id: e.id);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            )
                            .toList(),
                      );
  }
}
