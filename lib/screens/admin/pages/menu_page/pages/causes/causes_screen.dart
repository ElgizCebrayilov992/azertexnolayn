import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/screens/admin/global_companent/customer_column/customer_column.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/worker/companent/customer_textfield.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/companent/customer_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import 'causes_controller.dart';

class CausesScreen extends GetView<CausesController> {
  CausesScreen({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    controller.fetchAllCauses();
    return CustomerColumn(
      onPressed: () =>
          _showMyDialog(context, 'Yeni tətbiq olunacaq əlavə et', 'Əlavə et', 1),
      title: AppConstantsText.causes,
      children: [
        CustomerSearchTextField(
          onChanged: (value) {
            controller.causesSearch(text: value);
          },
        ),
        const Divider(),
        GetBuilder<CausesController>(builder: (controller) {
          int a = 1;
          //  print(controller.models.length);
          if(controller.loading==Loading.EMPTY){
            return const Center(child: Text('Bazada məlumat yoxdur'),);
          }else if(controller.loading==Loading.DONE){
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
                                      controller.causesVisible('1', e.id);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      name =
                                          TextEditingController(text: e.name);
                                      _showMyDialog(
                                          context, 'Məlumatı dəyiş', 'Dəyiş', 2,
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
          }else if(controller.loading==Loading.LOADING){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Center(child: Text('Əlaqə qurulmadı'),);
          }
        })
      ],
    );
  }


  Future<void> _showMyDialog(
      BuildContext context, String title, buttonText, int count,
      {String? id}) async {
        print("SS $id");
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
                    title: 'Ad:',
                    hintText: 'Məsələn: Məhsul',
                    controller: name),
              ],
            ),
          ),
          actions: buildDialogButtons(context, buttonText, count,id: id),
        );
      },
    );
  }

  List<Widget> buildDialogButtons(
      BuildContext context, String buttonText, int count,
      {String? id}) {
    return <Widget>[
      TextButton(
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.green),
        ),
        onPressed: () {
          if (count == 1) {
            controller.causesdAdd(name.text);
          } else {
            controller.causesUpdate(name.text, id);
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

