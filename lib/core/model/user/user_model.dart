// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
 String? id;
  String? name;
  String? status;
  String? mail;
  String? phone;
  String? password;
  String? section_name;
  String? section_id;
  String? section_status;
  String? position_id;
  String? position_name;
  String? position_status;
  String? user_status_id;
  String? user_status_name;
  String? user_status_status;
  String? authority_id;
  String? authority_name;

  UserModel({
    this.id,
    this.name,
    this.status,
    this.mail,
    this.phone,
    this.password,
    this.section_name,
    this.section_id,
    this.section_status,
    this.position_id,
    this.position_name,
    this.position_status,
    this.user_status_id,
    this.user_status_name,
    this.user_status_status,
    this.authority_id,
    this.authority_name,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
