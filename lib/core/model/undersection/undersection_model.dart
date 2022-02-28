import 'package:json_annotation/json_annotation.dart';
part 'undersection_model.g.dart';




@JsonSerializable()
class UndersectionModel {


  String? id;
  String? name;
  String? status;

  UndersectionModel({
    this.id,
    this.name,
    this.status,
  });
 factory UndersectionModel.fromJson(Map<String, dynamic> json) {
    return _$UndersectionModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$UndersectionModelToJson(this);
  }
}
