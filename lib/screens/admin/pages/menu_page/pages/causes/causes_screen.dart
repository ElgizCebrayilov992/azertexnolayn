import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CausesScreen extends StatelessWidget {
  CausesScreen({Key? key}) : super(key: key);
   TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomerColumn(
      onPressed: () {
        name = TextEditingController();
        _showMyDialog(context,0);
      },
      title: AppConstantsText.causes,
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
                                  onPressed: () {
                                    name = TextEditingController(text: e.title);
                                    _showMyDialog(context,1);
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
        )
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context, int i) async {
    
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yeni səbəb əlavə et'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomerTextField(
                    title: 'Ad:',
                    hintText: 'Məsələn: işçi xətası',
                    controller: name),
              ],
            ),
          ),
          actions: buildDialogButtons(context,i),
        );
      },
    );
  }

  List<Widget> buildDialogButtons(BuildContext context, int i) {
    return <Widget>[
     i==1 ?TextButton(
        child: const Text(
          'Dəyiş',
          style: TextStyle(color: Colors.green),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : TextButton(
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

      Section(id: 1, title: 'Avadanlıq xətası'),
      Section(id: 1, title: 'İşçi xətası'),
      Section(id: 1, title: 'Digər'),
    ];
  }
}
