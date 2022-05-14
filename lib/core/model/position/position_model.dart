import 'package:json_annotation/json_annotation.dart';
part 'position_model.g.dart';




@JsonSerializable()
class PositionModel {


  String? id;
  String? name;
  String? status;

  PositionModel({
    this.id,
    this.name,
    this.status,
  });
 factory PositionModel.fromJson(Map<String, dynamic> json) {
    return _$PositionModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$PositionModelToJson(this);
  }
  @override
  String toString() {
    return name??"";
  }
  
  
}
