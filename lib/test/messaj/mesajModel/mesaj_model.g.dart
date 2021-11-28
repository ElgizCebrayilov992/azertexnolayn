// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesaj_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestMesaj _$TestMesajFromJson(Map<String, dynamic> json) => TestMesaj(
      id: json['id'] as int?,
      basliq: json['basliq'] as String?,
      gonderen: json['gonderen'] as String?,
      kimler: (json['kimler'] as List<dynamic>?)
          ?.map((e) => TestMesajKimler.fromJson(e as Map<String, dynamic>))
          .toList(),
      qebulEtdi: json['qebulEtdi'] as String?,
      tarix: json['tarix'] as String?,
      timer: json['timer'] as String?,
      timerStatus: json['timerStatus'] as int?,
      mesajStatus: json['mesajStatus'] as int?,
    );

Map<String, dynamic> _$TestMesajToJson(TestMesaj instance) => <String, dynamic>{
      'id': instance.id,
      'basliq': instance.basliq,
      'gonderen': instance.gonderen,
      'kimler': instance.kimler,
      'qebulEtdi': instance.qebulEtdi,
      'tarix': instance.tarix,
      'timer': instance.timer,
      'timerStatus': instance.timerStatus,
      'mesajStatus': instance.mesajStatus,
    };
