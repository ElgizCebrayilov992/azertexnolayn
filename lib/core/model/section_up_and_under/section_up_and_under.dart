import 'package:json_annotation/json_annotation.dart';
part 'section_up_and_under.g.dart';

@JsonSerializable()
class SectionUpAndUnder {
  String? id;
  String? section_name;
  String? section_id;
  String? section_status;
  String? undersection_name;
  String? undersection_id;
  String? undersection_status;
  String? status;

  SectionUpAndUnder({
    this.id,
    this.section_name,
    this.section_id,
    this.section_status,
    this.undersection_name,
    this.undersection_id,
    this.undersection_status,
    this.status,
  });
  factory SectionUpAndUnder.fromJson(Map<String, dynamic> json) =>
      _$SectionUpAndUnderFromJson(json);
  Map<String, dynamic> toJson() => _$SectionUpAndUnderToJson(this);
}
