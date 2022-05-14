import 'package:flutter/material.dart';

class CustomerSeeMessage extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String? sum;
  final GestureTapCallback? onTap;
  const CustomerSeeMessage({
    Key? key,
    this.icon,
    this.iconColor,
    required this.title,
    this.sum,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Expanded(
                  child:  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Text(
                 sum??"",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
