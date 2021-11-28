// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestUserModel _$TestUserModelFromJson(Map<String, dynamic> json) =>
    TestUserModel(
      mail: json['mail'] as String?,
      password: json['password'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TestUserModelToJson(TestUserModel instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'password': instance.password,
      'status': instance.status,
    };
