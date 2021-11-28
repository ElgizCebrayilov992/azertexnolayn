import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'UYĞUNSUZLUQ HESABATI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('NONCONFORMITY REPORT'),
        ],
      ),
    );
  }
}