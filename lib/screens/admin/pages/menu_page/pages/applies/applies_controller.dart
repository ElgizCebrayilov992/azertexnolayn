import 'dart:io';

import 'package:azertexnolayn/core/model/applies/applies_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppliesController extends GetxController{
  Dio dio = ProjectNetworkManager.instance.dio;
  List<AppliesModel> models = [];
  List<AppliesModel> SearchModels = [];

  Future<void> fetchAllApplies() async {
    models.clear();
    final response = await dio.get(AppliesServicePath.APPLIES.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      for (var item in (data as List)) {
        AppliesModel model = AppliesModel.fromJson(item);

        if (model.status == '0') {
          SearchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    models = SearchModels;
    update();
  }

  appliesdAdd(String name) async {
    try {
      await dio.post(
        AppliesServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data); 
    fetchAllApplies();
  }

  appliesUpdate(String name, id) async {
   try {
      await dio.post(
        AppliesServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllApplies();
  }

  raisedVisible(String status, id) async {
    try {
      await dio.post(
        AppliesServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    
    fetchAllApplies();
  }

  appliesSearch({String text = ""}) async {
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      models = SearchModels;
    } else {
      models = SearchModels.where((element) =>
          element.name!.toLowerCase().contains(text.toLowerCase())).toList();
    }
    update();
  }
}

enum AppliesServicePath { APPLIES, ADD, UPDATE, VIS }

extension AppliesServicePathExtension on AppliesServicePath {
  String get rawValue {
    switch (this) {
      case AppliesServicePath.APPLIES:
        return '/applies/all';
      
      case AppliesServicePath.ADD:
        return '/applies/save';
      case AppliesServicePath.UPDATE:
        return '/applies/update';
      case AppliesServicePath.VIS:
        return '/applies/vis';
    }
  }
} 
