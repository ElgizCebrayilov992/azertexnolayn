import 'package:hive/hive.dart';

part 'local_model.g.dart';

@HiveType(typeId: 1)
class LocalModel {
  @HiveField(0)
  final String? serverPath;

  @HiveField(1)
  final String? imagePath;

  LocalModel({ this.serverPath, this.imagePath});

  LocalModel.fromJson(Map json)
      : serverPath = json['serverPath'],
        imagePath = json['imagePath'];

  toJson() {
    return {
      'serverPath': serverPath,
      'imagePath': imagePath,
    };
  }
}
