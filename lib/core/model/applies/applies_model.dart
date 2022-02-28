import 'package:json_annotation/json_annotation.dart';
part 'applies_model.g.dart';




@JsonSerializable()
class AppliesModel {


  String? id;
  String? name;
  String? status;

  AppliesModel({
    this.id,
    this.name,
    this.status,
  });
 factory AppliesModel.fromJson(Map<String, dynamic> json) {
    return _$AppliesModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$AppliesModelToJson(this);
  }
}
