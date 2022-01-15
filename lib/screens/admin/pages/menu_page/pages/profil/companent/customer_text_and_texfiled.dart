import 'package:flutter/material.dart';

class CustomerTextAndTextField extends StatelessWidget {
  const CustomerTextAndTextField({Key? key,required this.controller,required this.title}) : super(key: key);
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children:  [
                       Text(
                        title,
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Zəhmət olmasa adınızı yazın...',
                            contentPadding:  EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border:  OutlineInputBorder(),
                            enabledBorder:  OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}