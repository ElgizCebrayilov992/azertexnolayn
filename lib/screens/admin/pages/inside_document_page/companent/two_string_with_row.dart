import 'package:flutter/material.dart';

class TwoStringWithRow extends StatelessWidget {
  String title;
  String info;
  TextStyle? titleStyle;
  TextStyle? titleInfo;
  MainAxisSize mainAxisSize;

  TwoStringWithRow(
      {required this.title,
      required this.info,
      this.titleStyle,
      this.titleInfo,
      this.mainAxisSize = MainAxisSize.min});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        
        Text(
          info,
          style: titleInfo,
        ),
       
      ],
    );
  }
}
