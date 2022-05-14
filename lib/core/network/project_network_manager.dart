import 'package:dio/dio.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = ProjectNetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = 'http://localhost/aztex';
  late Dio dio;

  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}
