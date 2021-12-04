import 'package:animate_do/animate_do.dart';
import '../../../core/constants/constants_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPageSvg extends StatelessWidget {
  final double? height;
  final Color? color;
  const LoginPageSvg({this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(child: SvgPicture.asset(AppConstantsText.loginLogoImgPath,height: height,color: color,));
  }
}