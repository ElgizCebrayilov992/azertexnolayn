import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/worker_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
class WorkerScreen extends GetView<WorkerController> {
  WorkerScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController mail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomerColumn(
      onPressed: ()=> _showMyDialog(context),
      title: AppConstantsText.worker,
      children: [
        CustomerSearchTextField(
          onChanged: (value) {},
        ),
        const Divider(),
        buildTable(context)
      ],
    );
 
  }

  Expanded buildTable(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: SizedBox(
                width: context.dynamicWidth(1),
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Ad soyad'),
                ),
                DataColumn(
                  label: Text('Vəzifə'),
                ),
                DataColumn(
                  label: Text('Telefon'),
                ),
                DataColumn(
                  label: Text('Mail'),
                ),
                DataColumn(
                  label: Text('Struktur'),
                ),
                DataColumn(
                  label: Text(' '),
                ),
              ],
              rows: WorkerList.getList(60)
                  .map(
                    (e) => DataRow(
                      cells: [
                        DataCell(Text(e.name)),
                        DataCell(Text(e.phone)),
                        DataCell(Text(e.vezife)),
                        DataCell(Text(e.mail)),
                        DataCell(Text(e.struktur)),
                        DataCell(Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
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
  }

 

  Future<void> _showMyDialog(BuildContext context) async {
    print('sss');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni işçi əlavə et'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomerTextField(
                    title: 'Ad:', hintText: 'Məsələn: Elgiz', controller: name),
                CustomerTextField(
                    title: 'Soyad:',
                    hintText: 'Məsələn: Cebrayilov',
                    controller: surname),
                CustomerTextField(
                    title: 'Telefon:',
                    hintText: 'Məsələn: +994705608368',
                    controller: phone),
                CustomerTextField(
                    title: 'Mail',
                    hintText: 'Məsələn: virtu309a7@gmail.com',
                    controller: mail),
                SizedBox(
                  width: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vəzifə',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<WorkerController>(
                        builder: (controller) => DropdownButton(
                            isDense: true,
                            dropdownColor: Colors.white,
                            onChanged: (value) => controller.setApplies(value),
                            value: controller.selectPosition,
                            items: controller.listPosition
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
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bölmə',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<WorkerController>(
                        builder: (controller) => DropdownButton(
                            isDense: true,
                            dropdownColor: Colors.white,
                            onChanged: (value) => controller.setBolme(value),
                            value: controller.selectBolme,
                            items: controller.listBolme
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

class Worker {
  final String name;
  final String vezife;
  final String phone;
  final String mail;
  final String struktur;

  Worker({
    required this.name,
    required this.vezife,
    required this.phone,
    required this.mail,
    required this.struktur,
  });
}

class WorkerList {
  static List<Worker> getList(int a) {
    List<Worker> list = [];
    for (var i = 0; i < a; i++) {
      list.add(Worker(
          name: 'name $i',
          vezife: 'vezife $i',
          phone: 'phone $i',
          mail: 'mail $i',
          struktur: 'struktur $i'));
    }
    return list;
  }
}
