import 'dart:io';

import 'package:azertexnolayn/core/model/causes/causes_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum Loading { LOADING, DONE, FAILED, EMPTY }

class CausesController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  List<CausesModel> models = [];
  List<CausesModel> searchModels = [];
  var loading = Loading.LOADING;

  Future<void> fetchAllCauses() async {
    final response = await dio.get(CausesServicePath.APPLIES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
      searchModels = [];
      for (var item in (data as List)) {
        CausesModel model = CausesModel.fromJson(item);

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

  causesdAdd(String name) async {
    try {
      await dio.post(
        CausesServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllCauses();
  }

  causesUpdate(String name, id) async {
    try {
      await dio.post(
        CausesServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllCauses();
  }

  causesVisible(String status, id) async {
    try {
      await dio.post(
        CausesServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllCauses();
  }

  causesSearch({String text = ""}) async {
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

enum CausesServicePath { APPLIES, ADD, UPDATE, VIS }

extension CausesServicePathExtension on CausesServicePath {
  String get rawValue {
    switch (this) {
      case CausesServicePath.APPLIES:
        return '/causes/all';
      case CausesServicePath.ADD:
        return '/causes/save';
      case CausesServicePath.UPDATE:
        return '/causes/update';
      case CausesServicePath.VIS:
        return '/causes/vis';
    }
  }
}
