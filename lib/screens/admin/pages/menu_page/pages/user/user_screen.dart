import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/position/position_model.dart';
import 'package:azertexnolayn/core/model/user_auth/user_auth_model.dart';
import 'package:azertexnolayn/core/model/user_status/user_status_model.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/section/section_model.dart';

// ignore: must_be_immutable
class UserScreen extends GetView<UserController> {
  UserScreen({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.fetchAllUser();
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.searchAuth();
              controller.searchPosition();
              controller.searchSection();
              controller.searchStatus();
              name = TextEditingController(text: '');
              mail = TextEditingController(text: '');
              phone = TextEditingController(text: '');
              password = TextEditingController(text: '');
              _showMyDialog(context, 'Yeni adiyyat əlavə et', 'Əlavə et', 1);
            },
            icon: const Icon(Icons.add),
          )
        ],
        centerTitle: true,
        title: const Text(AppConstantsText.user),
      ),
      body: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomerSearchTextField(
                onChanged: (value) {
                  controller.searchUser(text: value);
                },
              ),
            ),
            const Divider(),
            GetBuilder<UserController>(
                initState: (state) {},
                builder: (controller) {
                  int a = 1;
                  //  print(controller.models.length);
                  if (controller.loading == Loading.EMPTY) {
                    return const Center(
                      child: Text('Bazada məlumat yoxdur'),
                    );
                  } else if (controller.loading == Loading.FAILED) {
                    return Center(
                        child: Text('Problem yarandi \n ${controller.mesaj}'));
                  } else if (controller.loading == Loading.LOADING) {
                    return const Center(
                      child: Text('məlumat yüklənir'),
                    );
                  } else {
                      print(' Cedvel yenilendi');
                    return Expanded(
                      child: SingleChildScrollView(
                        //      physics: NeverScrollableScrollPhysics(),
        
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: DataTable(
                            dividerThickness: 5.0,
                            dataRowHeight: 80,
                            columns: const [
                              DataColumn(
                                label: Flexible(child: Text('No')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Ad')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Mail')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Nömrə')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Üst bölmə')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Vəzifə')),
                              ),
                              DataColumn(
                                label:
                                    Flexible(child: Text('Uygunsuzluq görmə')),
                              ),
                              DataColumn(
                                label: Flexible(child: Text('Status')),
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
                                      DataCell(Text(e.mail!)),
                                      DataCell(Text(e.phone!)),
                                      DataCell(Text(e.section_name!)),
                                      DataCell(Text(e.position_name!)),
                                      DataCell(Text(e.user_status_name!)),
                                      DataCell(Text(e.authority_name!)),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.visibleUser('1', e.id);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              print('deyise girdi');
                                              password = TextEditingController(
                                                  text: e.password);
                                              name = TextEditingController(
                                                  text: e.name);
                                              mail = TextEditingController(
                                                  text: e.mail);
                                              phone = TextEditingController(
                                                  text: e.phone);
                                              controller.searchAuth(
                                                  sectionId: e.authority_id);
                                              controller.searchPosition(
                                                  sectionId: e.position_id);
                                              controller.searchSection(
                                                  sectionId: e.section_id);
                                              controller.searchStatus(
                                                  sectionId: e.user_status_id);
                                              _showMyDialog(context,
                                                  'Məlumatı dəyiş', 'Dəyiş', 2,
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
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(
      BuildContext context, String title, buttonText, int count,
      {String? id}) async {
    print('_showMyDialog girdi');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomerTextField(
                    title: 'Ad və Soyad:',
                    hintText: 'Məsələn: Prosses',
                    controller: name),
                CustomerTextField(
                    title: 'Mail:',
                    hintText: 'Məsələn: Prosses',
                    controller: mail),
                CustomerTextField(
                    title: 'Nömrə:',
                    hintText: 'Məsələn: Prosses',
                    controller: phone),
                CustomerTextField(
                  title: 'Şifrə:',
                  hintText: 'Məsələn: salsdj',
                  controller: password,
                ),
                GetBuilder<UserController>(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: DropdownButtonHideUnderline(
                                child: DropdownButton<SectionModel>(
                                  isDense: true,
                                  dropdownColor: Colors.white,
                                  value: controller.secModel,
                                  onChanged: (newValue) {
                                    controller.setSection(newValue!);
                                  },
                                  items: controller.secList.map((item) {
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
                            'Vəzifə',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: DropdownButtonHideUnderline(
                                child: DropdownButton<PositionModel>(
                                  isDense: true,
                                  dropdownColor: Colors.white,
                                  value: controller.positionModel,
                                  onChanged: (newValue) {
                                    controller.setPosition(newValue!);
                                  },
                                  items: controller.positionList.map((item) {
                                    return DropdownMenuItem<PositionModel>(
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
                            'Status',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: DropdownButtonHideUnderline(
                                child: DropdownButton<UserAuthModel>(
                                  isDense: true,
                                  dropdownColor: Colors.white,
                                  value: controller.authModel,
                                  onChanged: (newValue) {
                                    controller.setAuth(newValue!);
                                  },
                                  items: controller.authList.map((item) {
                                    return DropdownMenuItem<UserAuthModel>(
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
                            'Uyğunsuzluq görmə',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: DropdownButtonHideUnderline(
                                child: DropdownButton<UserStatusModel>(
                                  isDense: true,
                                  dropdownColor: Colors.white,
                                  value: controller.statusModel,
                                  onChanged: (newValue) {
                                    controller.setStatus(newValue!);
                                  },
                                  items: controller.statusList.map((item) {
                                    return DropdownMenuItem<UserStatusModel>(
                                      child: Text(item.name!),
                                      value: item,
                                    );
                                  }).toList(),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          actions: buildDialogButtons(context, buttonText, count, id: id),
        );
      },
    );
  }

  List<Widget> buildDialogButtons(
      BuildContext context, String buttonText, int count,
      {String? id}) {
    print('buildDialogButtons girdi');
    return <Widget>[
      TextButton(
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.green),
        ),
        onPressed: () {
          if (count == 1) {
            print('if updateUser girdi');
            controller.addUser(name.text, phone.text, mail.text, password.text);
          } else {
            print('else updateUser girdi');
            controller.updateUser(
                name.text, phone.text, mail.text, password.text, id);
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
}

class Section {
  final int id;
  final String title;

  Section({required this.id, required this.title});
}
