import 'package:json_annotation/json_annotation.dart';
part 'user_auth_model.g.dart';




@JsonSerializable()
class UserAuthModel {


  String? id;
  String? name;

  UserAuthModel({
    this.id,
    this.name,
  });
 factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return _$UserAuthModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
   return _$UserAuthModelToJson(this);
  }
}
//