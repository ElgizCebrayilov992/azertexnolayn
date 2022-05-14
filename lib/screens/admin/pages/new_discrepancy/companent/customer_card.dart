import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String? title;final String? info;
  const CustomerCard({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(info!)
          ],
        ),
      ),
    );
  }
}
