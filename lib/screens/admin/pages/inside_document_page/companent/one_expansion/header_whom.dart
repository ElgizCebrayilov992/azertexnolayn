import '../../../../../../core/constants/constants.dart';
import '../customer_card_widget/customer_card_widget.dart';
import 'package:flutter/material.dart';

import '../two_string_with_row.dart';

class HeaderWhom extends StatelessWidget {
  final String? name;
  final String raised;
  const HeaderWhom({Key? key, this.name = 'waiting..', required this.raised})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomerCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(''),
          TwoStringWithRow(
              title: AppConstants.pageRaised,
              info: raised,
              titleStyle: TextStyle(fontWeight: FontWeight.bold)),
          //todo bura qebul eden dusecek eger yoxdusa gozleyir yazacaq
          TwoStringWithRow(
              title: AppConstants.pageWhom,
              info: name!,
              titleStyle: TextStyle(fontWeight: FontWeight.bold)),
          Text(''),
        ],
      ),
    );
  }
}
