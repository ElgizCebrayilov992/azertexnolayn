import 'package:flutter/material.dart';

import '../two_string_with_row.dart';

class CardText extends StatelessWidget {
   CardText(
      { required this.title, required this.info, this.mainAxisSize});
     
  final String title;
  final String info;
  final MainAxisSize? mainAxisSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TwoStringWithRow(
            title: title, info: info, mainAxisSize: mainAxisSize!),
      ),
    );
  }
}
