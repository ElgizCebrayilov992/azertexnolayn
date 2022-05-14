// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatusModel _$UserStatusModelFromJson(Map<String, dynamic> json) =>
    UserStatusModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserStatusModelToJson(UserStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };
