// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_up_and_under.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionUpAndUnder _$SectionUpAndUnderFromJson(Map<String, dynamic> json) =>
    SectionUpAndUnder(
      id: json['id'] as String?,
      section_name: json['section_name'] as String?,
      section_id: json['section_id'] as String?,
      section_status: json['section_status'] as String?,
      undersection_name: json['undersection_name'] as String?,
      undersection_id: json['undersection_id'] as String?,
      undersection_status: json['undersection_status'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SectionUpAndUnderToJson(SectionUpAndUnder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section_name': instance.section_name,
      'section_id': instance.section_id,
      'section_status': instance.section_status,
      'undersection_name': instance.undersection_name,
      'undersection_id': instance.undersection_id,
      'undersection_status': instance.undersection_status,
      'status': instance.status,
    };
