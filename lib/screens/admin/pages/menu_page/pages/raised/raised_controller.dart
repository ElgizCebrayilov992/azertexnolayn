import 'dart:io';

import 'package:azertexnolayn/core/model/mesaj/mesaj_model.dart';
import 'package:azertexnolayn/core/model/raised/raised_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RaisedController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  List<RaisedModel> models = [];
  List<RaisedModel> SearchModels = [];

  Future<void> fetchAllRaiseds() async {
    models.clear();
    final response = await dio.get(RaisedServicePath.RAISEDS.rawValue);
    print('BBBBBBBBBBB $response');
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      print('CCCCCCCC $data');
      for (var item in (data as List)) {
        RaisedModel model = RaisedModel.fromJson(item);

        if (model.status == '0') {
          SearchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    models = SearchModels;
    update();
  }

  raisedAdd(String name) async {
    try {
      await dio.post(
        RaisedServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data); 
    fetchAllRaiseds();
  }

  raisedUpdate(String name, id) async {
   try {
      await dio.post(
        RaisedServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllRaiseds();
  }

  raisedVisible(String status, id) async {
    try {
      await dio.post(
        RaisedServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    
    fetchAllRaiseds();
  }

  raisedSearch({String text = ""}) async {
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

enum RaisedServicePath { RAISEDS, RAISED, ADD, UPDATE, VIS }

extension RaiSedServicePathExtension on RaisedServicePath {
  String get rawValue {
    switch (this) {
      case RaisedServicePath.RAISEDS:
        return '/raised/all';
      case RaisedServicePath.RAISED:
        return '/raised/raised';
      case RaisedServicePath.ADD:
        return '/raised/save';
      case RaisedServicePath.UPDATE:
        return '/raised/update';
      case RaisedServicePath.VIS:
        return '/raised/vis';
    }
  }
}
//http://localhost/azertexnolayn_server/restapi/api/raiseds
/**
 * raiseds
 * raised
 * add
 * update
 * vis
 * 
 */