import 'package:json_annotation/json_annotation.dart';
part 'causes_model.g.dart';




@JsonSerializable()
class CausesModel {


  String? id;
  String? name;
  String? status;

  CausesModel({
    this.id,
    this.name,
    this.status,
  });
 factory CausesModel.fromJson(Map<String, dynamic> json) {
    return _$CausesModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$CausesModelToJson(this);
  }
}
