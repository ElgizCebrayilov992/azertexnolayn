import 'package:json_annotation/json_annotation.dart';
part 'finding_model.g.dart';




@JsonSerializable()
class FindingModel {


  String? id;
  String? name;
  String? status;

  FindingModel({
    this.id,
    this.name,
    this.status,
  });
 factory FindingModel.fromJson(Map<String, dynamic> json) {
    return _$FindingModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$FindingModelToJson(this);
  }
}
