import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerButton extends StatelessWidget {
  const CustomerButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.onPressed})
      : super(key: key);
  final String title;
  final MaterialColor color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(0, 40)),
            
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
          ),
          onPressed: onPressed,
          child: Text(title,style:const TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
