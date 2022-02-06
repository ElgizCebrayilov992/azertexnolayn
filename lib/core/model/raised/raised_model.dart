import 'package:json_annotation/json_annotation.dart';
part 'raised_model.g.dart';




@JsonSerializable()
class RaisedModel {


  String? id;
  String? name;
  String? status;

  RaisedModel({
    this.id,
    this.name,
    this.status,
  });
 factory RaisedModel.fromJson(Map<String, dynamic> json) {
    return _$RaisedModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$RaisedModelToJson(this);
  }
}
