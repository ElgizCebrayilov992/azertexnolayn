import '../../../../../core/constants/constants_color.dart';
import '../../../../../core/constants/constants_text.dart';
import 'package:flutter/material.dart';

class CustomertextFormField extends StatelessWidget {
  final String title;

  final TextInputType inputType;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator validator;
  final TextEditingController controller;

  const CustomertextFormField({
    Key? key,
    required this.title,
    required this.inputType,
    required this.autovalidateMode,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppConstantsColor.purpleDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppConstantsColor.compColorWhite),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              maxLines: 1000,
              minLines: 1,
              textInputAction: TextInputAction.newline,
              validator: validator,
              controller: controller,
              autovalidateMode: autovalidateMode,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: AppConstantsColor.compColorWhite,
                  filled: true))
        ],
      ),
    );
  }
}
