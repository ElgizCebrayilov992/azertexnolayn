import 'package:azertexnolayn/core/constants/constants_color.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:flutter/material.dart';

class CustomerChip extends StatelessWidget {
  const CustomerChip({Key? key,required this.title,required this.onDeleted}) : super(key: key);
  final String title;
  final VoidCallback onDeleted;


  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteButtonTooltipMessage: AppConstantsText.delete,
      deleteIcon: const Icon(Icons.close),
      deleteIconColor: AppConstantsColor.adminColorRed,
      onDeleted: onDeleted,
      label:  Text(title),
      backgroundColor: AppConstantsColor.compColorWhite,
    );
  }
}
