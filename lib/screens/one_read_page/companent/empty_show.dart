import 'package:flutter/material.dart';

class EmptyShow extends StatelessWidget {
  const EmptyShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Uyğunsuzluq yoxdur.'),));
  }
}