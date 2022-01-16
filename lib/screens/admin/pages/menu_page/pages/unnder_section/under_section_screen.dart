import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/unnder_section/under_section_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class UnderSectionScreen extends GetView<UnderSectionController> {
  UnderSectionScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomerColumn(
      onPressed: () =>_showMyDialog(context),
      title: AppConstantsText.underSection,
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
                  label: Text('No'),
                ),
                DataColumn(
                  label: Text('Ad'),
                ),
                DataColumn(
                  label: Flexible(
                    child: Text('Üst Bölmə'),
                  ),
                ),
                DataColumn(
                  label: Text(' '),
                ),
              ],
              rows: SectionList.list()
                  .map(
                    (e) => DataRow(

                      cells: [
                        DataCell(Text(e.id.toString())),
                        DataCell(

                          Text(e.title),

                        ),
                        DataCell(Text(e.up_section)),
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
          title: const Text('Yeni bölmə əlavə et'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomerTextField(
                    title: 'Ad:',
                    hintText: 'Məsələn: Keyfiyyətə Nəzarət',
                    controller: name),
                Divider(),
                SizedBox(
                  width: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Üst bölmə',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<UnderSectionController>(
                        builder: (controller) => DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            dropdownColor: Colors.white,
                            onChanged: (value) => controller.setUser(value),
                            value: controller.selectUpSection,
                            items: controller.listUpSection
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
        child: const Text(
          'Əlavə et',
          style: TextStyle(color: Colors.green),
        ),
        onPressed: () {
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
  final String up_section;

  Section({required this.up_section, required this.id, required this.title});
}

class SectionList {
  static List<Section> list() {
    return [
      Section(id: 1, title: 'Emalatxana', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(
          id: 1,
          title:
              'Keyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətə Keyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətə Keyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətəKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətə NəzarətKeyfiyyətə Nəzarət',
          up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
      Section(id: 1, title: 'title', up_section: 'TX və TŞ'),
    ];
  }
}
