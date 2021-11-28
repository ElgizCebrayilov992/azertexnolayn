import 'package:flutter/material.dart';

class CustomertextFormField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextInputType inputType;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final Widget? icon;

  const CustomertextFormField(
      {Key? key,
      required this.title,
      this.isPassword = false,
      required this.inputType,
      required this.autovalidateMode,
      required this.validator,
      required this.controller,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 10,
                  minLines: 1,
                    textInputAction: TextInputAction.newline,
                    validator: validator,
                    controller: controller,
                    autovalidateMode: autovalidateMode,
                    keyboardType: TextInputType.multiline,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
