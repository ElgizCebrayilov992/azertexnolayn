import 'package:json_annotation/json_annotation.dart';
part 'user_status_model.g.dart';




@JsonSerializable()
class UserStatusModel {


  String? id;
  String? name;
  String? status;

  UserStatusModel({
    this.id,
    this.name,
    this.status
  });
 factory UserStatusModel.fromJson(Map<String, dynamic> json) {
    return _$UserStatusModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$UserStatusModelToJson(this);
  }
}
//