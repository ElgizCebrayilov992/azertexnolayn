import 'regex_constans.dart';

extension StringValidatorExtension on String {
  bool get isValidEmail1 => RegExp(RegexConstans.instance.emailRegex).hasMatch(this);
  bool get isValidPass => RegExp(RegexConstans.instance.passRegex).hasMatch(this);
}