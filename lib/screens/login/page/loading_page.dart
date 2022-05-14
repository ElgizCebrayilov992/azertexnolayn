import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        child: Center(
          child: Text('Gözləyin...'),
        ),
      ),
    );
  }
}
