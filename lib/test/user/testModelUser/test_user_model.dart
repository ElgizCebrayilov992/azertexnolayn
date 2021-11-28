import 'package:json_annotation/json_annotation.dart';

part 'test_user_model.g.dart';

@JsonSerializable()
class TestUserModel {
/*
{
  "username": "elgiz",
  "password": "salam1234"
} 
*/

  String? mail;
  String? password;
  int? status;

  TestUserModel({
    this.mail,
    this.password,
    this.status,
  });
  factory TestUserModel.fromJson(Map<String, dynamic> json) =>
      _$TestUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestUserModelToJson(this);
}
