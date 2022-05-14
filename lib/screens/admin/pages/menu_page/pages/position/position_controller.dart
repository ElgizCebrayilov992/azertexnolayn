import 'dart:io';

import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/position/position_model.dart';
import 'package:azertexnolayn/core/model/section_up_and_under/section_up_and_under.dart';
import 'package:azertexnolayn/core/model/undersection/undersection_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/section/section_model.dart';

class PositionController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  //Section

  PositionModel model = PositionModel();
  List<PositionModel> models = [];
  List<PositionModel> _searchModels = [];

  //
  var loading = Loading.LOADING;

  Future<List<PositionModel>> fetchAllPosition() async {
    final response = await dio.get(PositionServicePath.APPLIES.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
       _searchModels = [];
      for (var item in (data as List)) {
        PositionModel modele = PositionModel.fromJson(item);

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
    } else if (_searchModels.isEmpty) {
      loading = Loading.EMPTY;
    } else {
      loading = Loading.FAILED;
    }

    update();
    return models;
  }

  addPosition(String name) async {
    try {
      await dio.post(
        PositionServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllPosition();
  }

  updatePosition(String name, id) async {
    try {
      await dio.post(
        PositionServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllPosition();
  }

  visiblePosition(String status, id) async {
    try {
      await dio.post(
        PositionServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllPosition();
  }

  searchPosition({String text = ""}) async {
    if (text.isEmpty) {
      models = _searchModels;
    } else {
      models = _searchModels
          .where(
            (element) => element.name!.toLowerCase().contains(
                  text.toLowerCase(),
                ),
          )
          .toList();

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

enum PositionServicePath { APPLIES, ADD, UPDATE, VIS, WHERE }

extension SectionServicePathExtension on PositionServicePath {
  String get rawValue {
    switch (this) {
      case PositionServicePath.APPLIES:
        return '/position/all';
      case PositionServicePath.ADD:
        return '/position/save';
      case PositionServicePath.UPDATE:
        return '/position/update';
      case PositionServicePath.VIS:
        return '/position/vis';
      case PositionServicePath.WHERE:
        return '/position/whereid';
    }
  }
}
