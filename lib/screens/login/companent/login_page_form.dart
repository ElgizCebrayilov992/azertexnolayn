import '../../../core/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/constants_text.dart';
// ignore: unused_import
import '../../../validator/string_validator_extension.dart';
import '../page/login_screen_controller.dart';

// ignore: must_be_immutable
class LoginPageForm extends StatelessWidget {
  final double? topPadding;
  final double? rightPadding;
  final double? leftPadding;
  final double? sizedBoxHeight;
  final double? containerHeight;
  final double? containerWidth;

  var formKey = GlobalKey<FormState>();
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  LoginPageForm(
      {Key? key,
      this.topPadding,
      this.rightPadding,
      this.leftPadding,
      this.sizedBoxHeight,
      this.containerHeight,
      this.containerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: topPadding!,
                left: leftPadding!,
                right: rightPadding!,
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.disabled,
                validator: (value) =>
                    value!.isValidEmail1 ? null : AppConstantsText.validEmail,
                controller: controllerMail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none),
                ).copyWith(
                  hintText: AppConstantsText.hintTextMail,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppConstantsColor.compColorGtrey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: topPadding!,
                left: leftPadding!,
                right: rightPadding!,
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.disabled,
                validator: (value) =>
                    value!.isValidPass ? null : AppConstantsText.validPass,
                controller: controllerPass,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none),
                ).copyWith(
                  hintText: AppConstantsText.hintTextPass,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppConstantsColor.compColorGtrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizedBoxHeight!,
            ),
            SizedBox(
              //color: Colors.red,
              height: containerHeight!,
              width: containerWidth!,
              child: ElevatedButton(
                onPressed: () {
                  LoginScreenController().loginScreenController(context,
                      controllerMail: controllerMail,
                      controllerPass: controllerPass,
                      formKey: formKey);
                },
                child: Text(
                  AppConstantsText.clickButton,
                  style: context.appTheme.textTheme.headline5!.copyWith(
                    color: AppConstantsColor.compColorBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: AppConstantsColor.compColorBlue,
                            style: BorderStyle.solid),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
            )
          ],
        ));
  }

  
}
