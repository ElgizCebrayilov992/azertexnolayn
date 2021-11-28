import 'package:flutter/material.dart';

class TwoStringWithRowAndExpanded extends StatelessWidget {
  const TwoStringWithRowAndExpanded({Key? key, required this.title, this.info='', this.flex=4}) : super(key: key);
final String title;
final String? info;
final int? flex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title),
          ),
          Expanded(
            flex: flex!,
            child: Text(
              info!,
            ),
          )
        ],
      ),
    );
  }
}