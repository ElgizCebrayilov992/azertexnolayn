import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  const CustomerTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller})
      : super(key: key);
  final String title, hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      // color: Colors.grey.shade200,
      child: Container(
        padding: EdgeInsets.only(left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(hintText: hintText),
            ),
          ],
        ),
      ),
    );
  }
}
