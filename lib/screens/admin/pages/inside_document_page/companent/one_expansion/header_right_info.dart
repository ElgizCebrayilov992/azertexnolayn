import 'package:flutter/material.dart';

import '../two_string_with_row.dart';
class HeaderRightInfo extends StatelessWidget {
  const HeaderRightInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        boxShadow: [
           BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
          ),
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TwoStringWithRow(title: 'Doc. No:', info: 'ATL-QMS-F-009',
                titleStyle: TextStyle(fontWeight: FontWeight.bold)),
               
                TwoStringWithRow(title: 'Issue date', info: '19.11.2013',
                titleStyle: TextStyle(fontWeight: FontWeight.bold)),
                
                TwoStringWithRow(title: 'Rev. No:', info: '04'),
                
                TwoStringWithRow(title: 'Rev.d ate:', info: '10.10.2017',
                titleStyle: TextStyle(fontWeight: FontWeight.bold)),
              ]),
        ),
      ),
    );
  }
}