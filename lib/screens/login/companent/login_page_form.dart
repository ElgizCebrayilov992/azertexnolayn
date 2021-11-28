import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/constants.dart';
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
                    value!.isValidEmail1 ? null : AppConstants.validEmail,
                controller: controllerMail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none),
                ).copyWith(
                  hintText: AppConstants.hintTextMail,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppConstants.compColorGtrey,
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
                    value!.isValidPass ? null : AppConstants.validPass,
                controller: controllerPass,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none),
                ).copyWith(
                  hintText: AppConstants.hintTextPass,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppConstants.compColorGtrey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizedBoxHeight!,
            ),
            Container(
              //color: Colors.red,
              height: containerHeight!,
              width: containerWidth!,
              child: ElevatedButton(
                onPressed: () {
                  LoginScreenController().loginScreenController(
                      controllerMail: controllerMail,
                      controllerPass: controllerPass,
                      formKey: formKey);
                },
                child: Text(
                  AppConstants.clickButton,
                  style: context.appTheme.textTheme.headline5!.copyWith(
                    color: AppConstants.compColorBlue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: AppConstants.compColorBlue,
                            style: BorderStyle.solid),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
            )
          ],
        ));
  }

  void salam(GlobalKey<FormState> formKey, TextEditingController controllerMail,
      TextEditingController controllerPass) {}
}
