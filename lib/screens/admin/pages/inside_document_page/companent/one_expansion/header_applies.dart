import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants_text.dart';
import '../customer_card_widget/customer_card_widget.dart';
import '../two_string_with_row.dart';

class Applies extends StatelessWidget {
  const Applies({Key? key, required this.applies}) : super(key: key);
  final String applies;

  @override
  Widget build(BuildContext context) {
    return CustomerCardWidget(
      child: Column(
        children: [
          Text(''),
          Text(''),
          TwoStringWithRow(
            title: AppConstantsText.pageApplis,
            info: applies,
            titleStyle: TextStyle(fontWeight: FontWeight.bold)
          ),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}
