import 'dart:io';

import 'package:azertexnolayn/core/model/mesaj/mesaj_model.dart';
import 'package:azertexnolayn/core/model/raised/raised_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RaisedController extends GetxController {
  final Dio dio = ProjectNetworkManager.instance.dio;
  List<RaisedModel> models = [];
  List<RaisedModel> SearchModels = [];

  Future<void> fetchAllRaiseds() async {
    models.clear();
    final response = await dio.get(RaisedServicePath.RAISEDS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      for (var item in (data as List)) {
        RaisedModel model = RaisedModel.fromJson(item);

        if (model.status == '1') {
          SearchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    } 
    models=SearchModels;
    update();
  }
 

  raisedAdd(String name) async {
    final uri = Uri(path: "${RaisedServicePath.ADD.rawValue}/$name");
    final post = await dio.postUri(uri);
    MesajModel model = MesajModel.fromJson(post.data);
    fetchAllRaiseds();
   
  }

  raisedUpdate(String name, id) async {
  
    final uri = Uri(path: "${RaisedServicePath.UPDATE.rawValue}/$name/$id");
    final post = await dio.putUri(uri);
    MesajModel model = MesajModel.fromJson(post.data);
    fetchAllRaiseds();
    
  }
  raisedVisible(String status, id) async {
    
    final uri = Uri(path: "${RaisedServicePath.VIS.rawValue}/$id/$status");
    final post = await dio.putUri(uri);
    MesajModel model = MesajModel.fromJson(post.data);
    fetchAllRaiseds();
    
  }
  raisedSearch({String text=""}) async {
  if (text.isEmpty) {
     
      // if the search field is empty or only contains white-space, we'll display all users
      models=SearchModels;
    } else {
     
      models= SearchModels
          .where((element) =>
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
        return '/raiseds';
      case RaisedServicePath.RAISED:
        return '/raised';
      case RaisedServicePath.ADD:
        return '/add';
      case RaisedServicePath.UPDATE:
        return '/update';
      case RaisedServicePath.VIS:
        return '/vis';
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