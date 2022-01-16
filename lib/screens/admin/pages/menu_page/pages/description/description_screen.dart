import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomerColumn(
      onPressed: () => _showMyDialog(context),
      title: AppConstantsText.standardClauseTitle,
      children: [
        CustomerSearchTextField(
          onChanged: (value) {},
        ),
        const Divider(),
        Expanded(
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
                  rows: SectionList.list()
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(Text(e.id.toString())),
                            DataCell(Text(e.title)),
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
        )
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni açıqlama əlavə et'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomerTextField(
                    title: 'Ad:',
                    hintText: 'Məsələn: uyğunsuzluq',
                    controller: name),
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
        child: const Text('Ləğv et',style: TextStyle(color: Colors.red),),
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

class SectionList {
  static List<Section> list() {
    return [

      Section(id: 1, title: 'Uyğunsuzlq'),
      Section(id: 1, title: 'Potensiyal uyğunsuzluq'),
      Section(id: 1, title: 'Müşahidə'),
      Section(id: 1, title: 'Çox əhəmiyyətli'),
      Section(id: 1, title: 'Az əhəmiyyətli'),
      
    ];
  }
}
