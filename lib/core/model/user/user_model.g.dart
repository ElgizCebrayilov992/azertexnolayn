// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      section_name: json['section_name'] as String?,
      section_id: json['section_id'] as String?,
      section_status: json['section_status'] as String?,
      position_id: json['position_id'] as String?,
      position_name: json['position_name'] as String?,
      position_status: json['position_status'] as String?,
      user_status_id: json['user_status_id'] as String?,
      user_status_name: json['user_status_name'] as String?,
      user_status_status: json['user_status_status'] as String?,
      authority_id: json['authority_id'] as String?,
      authority_name: json['authority_name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'mail': instance.mail,
      'phone': instance.phone,
      'password': instance.password,
      'section_name': instance.section_name,
      'section_id': instance.section_id,
      'section_status': instance.section_status,
      'position_id': instance.position_id,
      'position_name': instance.position_name,
      'position_status': instance.position_status,
      'user_status_id': instance.user_status_id,
      'user_status_name': instance.user_status_name,
      'user_status_status': instance.user_status_status,
      'authority_id': instance.authority_id,
      'authority_name': instance.authority_name,
    };
