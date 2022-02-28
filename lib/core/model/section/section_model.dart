import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';




@JsonSerializable()
class SectionModel {


  String? id;
  String? name;
  String? status;

  SectionModel({
    this.id,
    this.name,
    this.status,
  });
 factory SectionModel.fromJson(Map<String, dynamic> json) {
    return _$SectionModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$SectionModelToJson(this);
  }
}
