import '../../../../../../core/constants/constants_text.dart';
import '../customer_card_widget/customer_card_widget.dart';
import 'package:flutter/material.dart';

import '../two_string_with_row.dart';


class HeaderTimeAndName extends StatelessWidget {
  final String name;
  final String time;
  final String bolme;

  const HeaderTimeAndName({Key? key, required this.name, required this.time, required this.bolme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TwoStringWithRow(
              title: AppConstantsText.pageDate,
              info: time,
              titleStyle: const TextStyle(fontWeight: FontWeight.bold)),
          TwoStringWithRow(
              title: AppConstantsText.pageArea,
              info: bolme,
              titleStyle: const TextStyle(fontWeight: FontWeight.bold)),
          TwoStringWithRow(
              title: AppConstantsText.pageInitiator,
              info: name,
              titleStyle: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}