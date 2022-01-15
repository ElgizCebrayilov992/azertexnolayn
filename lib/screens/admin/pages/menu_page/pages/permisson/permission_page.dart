import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'permission_controller.dart';

class PermisssionPage extends GetView<PermisiionController> {
  PermisssionPage({Key? key}) : super(key: key);
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomerColumn(
      onPressed: () =>  _showMyDialog(context),
      title: AppConstantsText.permission,
      children: [
        CustomerSearchTextField(
          onChanged: (value) {},
        ),
        const Divider(),
        buildTable(),
      ],
    );

   
  }

  Expanded buildTable() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text('Ad soyad'),
              ),
              DataColumn(
                label: Text('Vəzifə'),
              ),
              DataColumn(
                label: Text('username'),
              ),
              DataColumn(
                label: Text('Password'),
              ),
              DataColumn(
                label: Text('status'),
              ),
              DataColumn(
                label: Text('Uygunsuzluq görmə'),
              ),
              DataColumn(
                label: Text(' '),
              ),
            ],
            rows: PermissionDaoList.list()
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(Text(e.fullName)),
                      DataCell(Text(e.position)),
                      DataCell(Text(e.username)),
                      DataCell(Text(e.password)),
                      DataCell(Text(e.status)),
                      DataCell(Text(e.vision)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni Icazə əlavə et'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ad və Soyad',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<PermisiionController>(
                        builder: (controller) => DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            dropdownColor: Colors.white,
                            onChanged: (value) => controller.setUser(value),
                            value: controller.selectUser,
                            items: controller.listUser
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
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<PermisiionController>(
                        builder: (controller) => DropdownButton(
                            isDense: true,
                            dropdownColor: Colors.white,
                            onChanged: (value) => controller.setStatus(value),
                            value: controller.selectStatus,
                            items: controller.listStatus
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Uyğunsuzluq görmə',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<PermisiionController>(
                      builder: (controller) => DropdownButton(
                        isDense: true,
                        dropdownColor: Colors.white,
                        onChanged: (value) => controller.setVision(value),
                        value: controller.selectVision,
                        items: controller.listVision
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: e,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    CustomerTextField(
                        title: 'Username:',
                        hintText: 'Məsələn: elgiz309',
                        controller: username),
                    CustomerTextField(
                        title: 'Şifrə:',
                        hintText: 'Məsələn: qüert123',
                        controller: password),
                  ],
                ),
              ],
            ),
          ),
          actions: buildDialogButtons(context),
        );
      },
    );
  }

  List<Widget> buildDialogButtons(BuildContext context) {
    return <Widget>[
      TextButton(
        child: const Text('Əlavə et'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        child: const Text('Ləğv et'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
  }
}

class PermissionDAO {
  final String fullName, position, username, password, status, vision;

  PermissionDAO(
      {required this.fullName,
      required this.position,
      required this.username,
      required this.password,
      required this.status,
      required this.vision});
}

class PermissionDaoList {
  static List<PermissionDAO> list() {
    return [
      PermissionDAO(
          fullName: 'Elgiz Cebrayilov',
          position: 'Temir isleri uzure koordinator',
          username: 'flankes',
          password: 'password',
          status: 'Admin',
          vision: 'Butun mesajlari gorme'),
      PermissionDAO(
          fullName: 'Elgiz Cebrayilov1',
          position: 'Temir isleri uzure koordinator',
          username: 'flankes',
          password: 'password',
          status: 'Istifadeci',
          vision: 'Yalniz oz bolmesin mesajini gorme'),
      PermissionDAO(
          fullName: 'Elgiz Cebrayilov2',
          position: 'Temir isleri uzure koordinator',
          username: 'flankes',
          password: 'password',
          status: 'Istifadeci',
          vision: 'Hec biri'),
    ];
  }
}
