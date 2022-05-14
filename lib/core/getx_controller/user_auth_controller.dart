// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/user_auth/user_auth_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  //Section

  UserAuthModel model = UserAuthModel();
  List<UserAuthModel> models = [];
  List<UserAuthModel> searchModels = [];
  var loading = Loading.LOADING;

  Future<List<UserAuthModel>> fetchAllSection() async {
    final response = await dio.get(SectionServicePath.APPLIES.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
      // searchModels = [];
      for (var item in (data as List)) {
        var modele = UserAuthModel.fromJson(item);

        if (searchModels.isEmpty) {
          searchModels.add(modele);
        } else {
          int a = 0;
          for (var item in searchModels) {
            if (item.id == modele.id) {
              a = 1;
            }
          }
          if (a == 0) {
            searchModels.add(modele);
          }
        }
      }
      int a = 0;
      for (var item in searchModels) {
        if (models.isEmpty) {
          models.add(item);
        } else {
          for (var model in models) {
            if (model.id == item.id) {
              a = 1;
            }
          }
          if (a == 0) {
            models.add(item);
          }
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    if (models.isNotEmpty) {
      loading = Loading.DONE;
    } else if (searchModels.isEmpty) {
      loading = Loading.EMPTY;
    } else {
      loading = Loading.FAILED;
    }

    update();
    return models;
  }
}

enum SectionServicePath { APPLIES, ADD, UPDATE, VIS, WHERE }

extension SectionServicePathExtension on SectionServicePath {
  String get rawValue {
    switch (this) {
      case SectionServicePath.APPLIES:
        return '/authority/all';
      case SectionServicePath.ADD:
        return '/authority/save';
      case SectionServicePath.UPDATE:
        return '/authority/update';
      case SectionServicePath.VIS:
        return '/authority/vis';
      case SectionServicePath.WHERE:
        return '/authority/whereid';
    }
  }
}
