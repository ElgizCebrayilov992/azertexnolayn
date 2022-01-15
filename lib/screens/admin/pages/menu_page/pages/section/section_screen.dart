import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstantsText.section),
        centerTitle: true,
      ),
      body: Text('data'),
    );
  }
}
