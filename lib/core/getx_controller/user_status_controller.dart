// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/user_status/user_status_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class UserStatusController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  //Section

  UserStatusModel model = UserStatusModel();
  List<UserStatusModel> models = [];
  final List<UserStatusModel> _searchModels = [];

  var loading = Loading.LOADING;

  Future<List<UserStatusModel>> fetchAllSection() async {
    final response = await dio.get(SectionServicePath.APPLIES.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
       models = [];
      // searchModels = [];
      for (var item in (data as List)) {
        UserStatusModel modele = UserStatusModel.fromJson(item);

      if (modele.status == '0') {
          if (_searchModels.isEmpty) {
            _searchModels.add(modele);
          } else {
            int a = 0;
            for (var item in _searchModels) {
              if (item.id == modele.id) {
                a = 1;
              }
            }
            if (a == 0) {
              _searchModels.add(modele);
            }
          }
        }
      }
      int a = 0;
      for (var item in _searchModels) {
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
    } else if (models.isEmpty) {
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
        return '/userstatus/all';
      case SectionServicePath.ADD:
        return '/userstatus/save';
      case SectionServicePath.UPDATE:
        return '/userstatus/update';
      case SectionServicePath.VIS:
        return '/userstatus/vis';
      case SectionServicePath.WHERE:
        return '/userstatus/whereid';
    }
  }
}
