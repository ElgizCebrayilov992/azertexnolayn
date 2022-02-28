import 'dart:io';

import 'package:azertexnolayn/core/model/causes/causes_model.dart';
import 'package:azertexnolayn/core/model/finding/finding_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum Loading { LOADING, DONE, FAILED, EMPTY }

class FindingController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  List<FindingModel> models = [];
  List<FindingModel> searchModels = [];
  var loading = Loading.LOADING;

  Future<void> fetchAllFinding() async {
    final response = await dio.get(FindingServicePath.APPLIES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
      searchModels = [];
      for (var item in (data as List)) {
        FindingModel model = FindingModel.fromJson(item);

        if (model.status == '0') {
          searchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    if (searchModels.isNotEmpty) {
      loading = Loading.DONE;
      models = searchModels;
    } else if (searchModels.isEmpty) {
      loading = Loading.EMPTY;
    } else {
      loading = Loading.FAILED;
    }

    update();
  }


  Stream<void> allList() async*{
    yield* Stream.periodic(const Duration(seconds: 1),(_) async{
      print('s');
      return _checkList();
    }).asyncMap((event) async => await loading);
  }
  Future<int> _checkList() async{
     print('ss');
    try {
       final response = await dio.get(FindingServicePath.APPLIES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
      searchModels = [];
      for (var item in (data as List)) {
        FindingModel model = FindingModel.fromJson(item);

        if (model.status == '0') {
          searchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    if (searchModels.isNotEmpty) {
      loading = Loading.DONE;
      models = searchModels;
      return 1;
    } else if (searchModels.isEmpty) {
      loading = Loading.EMPTY;
      return 2;
    } else {
      loading = Loading.FAILED;
      return 0;
    }
    } catch (e) {
      return 0;
    }
  }

  findingAdd(String name) async {
    try {
      await dio.post(
        FindingServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllFinding();
  }

  findingUpdate(String name, id) async {
    try {
      await dio.post(
        FindingServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllFinding();
  }

  findingVisible(String status, id) async {
    try {
      await dio.post(
        FindingServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllFinding();
  }

  findingSearch({String text = ""}) async {
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      models = searchModels;
    } else {
      models = searchModels.where((element) =>
          element.name!.toLowerCase().contains(text.toLowerCase())).toList();
      loading = Loading.DONE;
      if (models.isNotEmpty) {
        loading = Loading.DONE;
      } else if (models.isEmpty) {
        loading = Loading.EMPTY;
      } else {
        loading = Loading.FAILED;
      }
    }
    update();
  }
}

enum FindingServicePath { APPLIES, ADD, UPDATE, VIS }

extension FindingServicePathExtension on FindingServicePath {
  String get rawValue {
    switch (this) {
      case FindingServicePath.APPLIES:
        return '/finding/all';
      case FindingServicePath.ADD:
        return '/finding/save';
      case FindingServicePath.UPDATE:
        return '/finding/update';
      case FindingServicePath.VIS:
        return '/finding/vis';
    }
  }
}
