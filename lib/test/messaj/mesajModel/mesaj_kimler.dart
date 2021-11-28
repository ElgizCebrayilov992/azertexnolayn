import 'package:json_annotation/json_annotation.dart';

part 'mesaj_kimler.g.dart';

@JsonSerializable()
class TestMesajKimler {
/*
{
  "ad": "Turxna Ibrahimov"
} 
*/

  String? ad;

  TestMesajKimler({
    this.ad,
  });
  factory TestMesajKimler.fromJson(Map<String, dynamic> json) =>
      _$TestMesajKimlerFromJson(json);
  Map<String, dynamic> toJson() => _$TestMesajKimlerToJson(this);
}
