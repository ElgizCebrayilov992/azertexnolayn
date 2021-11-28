import 'package:flutter/material.dart';

import '../two_string_with_row.dart';

class TypeOfDiscovery extends StatelessWidget {
  const TypeOfDiscovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TwoStringWithRow(
                mainAxisSize: MainAxisSize.max,
                  title: 'Tapıntının növü/Type of discovery',
                  info: ' UYĞUNSUZLUQ / NON-CONFORMITY'),
            ),
          );
  }
}