import 'package:flutter/material.dart';

class CustomerColumn extends StatelessWidget {
  const CustomerColumn({
    Key? key,
    required this.title,
    this.onPressed,
    required this.children,
  }) : super(key: key);
  final String title;
  final VoidCallback? onPressed;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add),
        ),
      ],
    ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}
