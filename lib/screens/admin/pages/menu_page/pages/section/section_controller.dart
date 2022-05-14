import 'dart:io';

import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/section_up_and_under/section_up_and_under.dart';
import 'package:azertexnolayn/core/model/undersection/undersection_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/section/section_model.dart';


class SectionController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  //Section
  bool change = true;
  SectionModel model = SectionModel();
  UndersectionModel underModel = UndersectionModel();
  List<SectionModel> models = [];
  List<SectionModel> searchModels = [];
  //Undersection
  //UndersectionModel

  List<UndersectionModel> unModels = [];
  List<UndersectionModel> unSearchModels = [];

  //up and under
  List<SectionUpAndUnder> unAndUpModels = [];
  List<SectionUpAndUnder> unAndUpSearchModels = [];

  //
  var loading = Loading.LOADING;
  var unLoading = Loading.LOADING;
  var upAndUnderLoading = Loading.LOADING;
  setChange(int a) {
    print(a);
    if (a == 2) {
      change = false;
    } else {
      change = true;
    }
    update();
  }

  Future<List<SectionModel>> fetchAllSection() async {
    print('fetchAllSection');
    final response = await dio.get(SectionServicePath.APPLIES.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      models = [];
      change ?  searchModels.clear():null;
      for (var item in (data as List)) {
        SectionModel modele = SectionModel.fromJson(item);

        if (modele.status == '0') {
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
    } else if (models.isEmpty) {
      loading = Loading.EMPTY;
    } else {
      loading = Loading.FAILED;
    }

    update();
    return models;
  }

  searchSection({String? sectionId}) async {
    model = SectionModel();

    for (var item in models) {
      if (item.id == sectionId) {
        model = item;
      }
    }
    if (model.id == null) {
      model = models[0];
    }
  }

  Future<void> searchUnSectionList({String? unSectionId}) async {
    for (var item in unModels) {
      if (item.id == unSectionId) {
        underModel = item;
      }
    }
    if (underModel.id == null) {
      underModel = unModels[0];
    }

    update();
  }

  sectionAdd(String name) async {
    try {
      await dio.post(
        SectionServicePath.ADD.rawValue,
        data: {"name": name, "status": "0"},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllSection();
  }

  sectionUpdate(String name, id) async {
    try {
      await dio.post(
        SectionServicePath.UPDATE.rawValue,
        data: {"id": id, "name": name},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllSection();
  }

  sectionVisible(String status, id) async {
    try {
      await dio.post(
        SectionServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllSection();
  }

  sectionSearch({String text = ""}) async {
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      models = searchModels;
    } else {
      models = searchModels
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
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
//undersection
/*
  List<UndersectionModel> unModels = [];
  List<UndersectionModel> unSearchModels = [];
*/

  Future<void> fetchAllUnSection() async {
    final response = await dio.get(UnderSectionServicePath.APPLIES.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      unModels = [];
      change ?  unSearchModels.clear():null;
      //  unSearchModels = [];
      for (var item in (data as List)) {
        UndersectionModel modele = UndersectionModel.fromJson(item);

        if (modele.status == '0') {
          if (unSearchModels.isEmpty) {
            unSearchModels.add(modele);
          } else {
            int a = 0;
            for (var item in unSearchModels) {
              if (item.id == modele.id) {
                a = 1;
              }
            }
            if (a == 0) {
              unSearchModels.add(modele);
            }
          }
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
      int a = 0;
      for (var item in unSearchModels) {
        if (models.isEmpty) {
          unModels.add(item);
        } else {
          for (var model in models) {
            if (model.id == item.id) {
              a = 1;
            }
          }
          if (a == 0) {
            unModels.add(item);
          }
        }
      }
    }
    if (unModels.isNotEmpty) {
      unLoading = Loading.DONE;
    } else if (unModels.isEmpty) {
      unLoading = Loading.EMPTY;
    } else {
      unLoading = Loading.FAILED;
    }

    update();
  }

  Future<void> searchUnSection(String id) async {
    final response = await dio.post(
      UnderSectionServicePath.WHERE.rawValue,
      data: {"id": id},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      for (var item in (data as List)) {
        underModel = UndersectionModel.fromJson(item);
      }
      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    if (underModel.id == null) {
      underModel = unSearchModels[0];
    }

    update();

    ;
  }

  unSectionAdd(String name) async {
    try {
      await dio.post(
        UnderSectionServicePath.ADD.rawValue,
        data: {'name': name, 'status': '0'},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllUnSection();
  }

  unSectionUpdate(String name, id) async {
    try {
      await dio.post(
        UnderSectionServicePath.UPDATE.rawValue,
        data: {'name': name, 'id': id},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllUnSection();
  }

  unSectionVisible(String status, id) async {
    print(status);
    print(id);
    try {
      await dio.post(
        UnderSectionServicePath.VIS.rawValue,
        data: {'status': status, 'id': id},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllUnSection();
  }

  unSectionSearch({String text = ""}) async {
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      unModels = unSearchModels;
    } else {
      unModels = unSearchModels
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
      loading = Loading.DONE;
      if (unModels.isNotEmpty) {
        unLoading = Loading.DONE;
      } else if (unModels.isEmpty) {
        unLoading = Loading.EMPTY;
      } else {
        unLoading = Loading.FAILED;
      }
    }
    update();
  }

//up and under

  Future<void> fetchAllUnAndUpSection() async {
    final response =
        await dio.get(UnderAndUpSectionServicePath.COMPLETE.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      unAndUpModels = [];
      unAndUpSearchModels = [];
      for (var item in (data as List)) {
        SectionUpAndUnder model = SectionUpAndUnder.fromJson(item);

        if (model.status == '0') {
          unAndUpSearchModels.add(model);
        }
      }

      // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
    }
    if (unAndUpSearchModels.isNotEmpty) {
      
      unAndUpModels = unAndUpSearchModels;
      upAndUnderLoading = Loading.DONE;
    } else if (unAndUpSearchModels.isEmpty) {
      upAndUnderLoading = Loading.EMPTY;
    } else {
      upAndUnderLoading = Loading.FAILED;
    }

    update();
  }

  unAndUpSectionAdd(String section_id, undersection_id) async {
    try {
      await dio.post(
        UnderAndUpSectionServicePath.ADD.rawValue,
        data: {
          'section_id': section_id,
          'undersection_id': undersection_id,
          'status': '0'
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    //MesajModel model = MesajModel.fromJson(post.data);
    fetchAllUnAndUpSection();
  }

  unAndUpSectionUpdate(String section_id, undersection_id, id) async {
    try {
      await dio.post(
        UnderAndUpSectionServicePath.UPDATE.rawValue,
        data: {
          'section_id': section_id,
          'undersection_id': undersection_id,
          'id': id
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllUnAndUpSection();
  }

  unAndUpSectionVisible(String status, id) async {
    print(status);
    print(id);
    try {
      await dio.post(
        UnderAndUpSectionServicePath.VIS.rawValue,
        data: {'status': status, 'id': id},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }

    fetchAllUnAndUpSection();
  }

  unAndUpSectionSearch({String text = ""}) async {
    if (text == "") {
      // if the search field is empty or only contains white-space, we'll display all users
      fetchAllUnAndUpSection();
    } else {
      unAndUpModels = unAndUpSearchModels
          .where((element) =>
              element.section_name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
      loading = Loading.DONE;
      if (unAndUpModels.isNotEmpty) {
        upAndUnderLoading = Loading.DONE;
      } else if (unAndUpModels.isEmpty) {
        unAndUpModels = unAndUpSearchModels
            .where((element) => element.undersection_name!
                .toLowerCase()
                .contains(text.toLowerCase()))
            .toList();
        loading = Loading.DONE;
        if (unAndUpModels.isNotEmpty) {
          upAndUnderLoading = Loading.DONE;
        } else if (unAndUpModels.isEmpty) {
          upAndUnderLoading = Loading.EMPTY;
        } else {
          upAndUnderLoading = Loading.FAILED;
        }
      } else {
        upAndUnderLoading = Loading.FAILED;
      }
    }
    update();
  }

  void setSection(SectionModel newValue) {
    model = newValue;
    fetchAllSection();
  }

  void setUnSection(UndersectionModel newValue) {
    underModel = newValue;
    fetchAllUnSection();
  }
}

enum SectionServicePath { APPLIES, ADD, UPDATE, VIS, WHERE }

extension SectionServicePathExtension on SectionServicePath {
  String get rawValue {
    switch (this) {
      case SectionServicePath.APPLIES:
        return '/section/all';
      case SectionServicePath.ADD:
        return '/section/save';
      case SectionServicePath.UPDATE:
        return '/section/update';
      case SectionServicePath.VIS:
        return '/section/vis';
      case SectionServicePath.WHERE:
        return '/section/whereid';
    }
  }
}

enum UnderSectionServicePath { APPLIES, ADD, UPDATE, VIS, WHERE }

extension UnderSectionServicePathExtension on UnderSectionServicePath {
  String get rawValue {
    switch (this) {
      case UnderSectionServicePath.APPLIES:
        return '/undersection/all';
      case UnderSectionServicePath.ADD:
        return '/undersection/save';
      case UnderSectionServicePath.UPDATE:
        return '/undersection/update';
      case UnderSectionServicePath.VIS:
        return '/undersection/vis';
      case UnderSectionServicePath.WHERE:
        return '/undersection/whereId';
    }
  }
}

enum UnderAndUpSectionServicePath { APPLIES, ADD, UPDATE, VIS, COMPLETE }

extension UnderAndUpSectionServicePathExtension
    on UnderAndUpSectionServicePath {
  String get rawValue {
    switch (this) {
      case UnderAndUpSectionServicePath.APPLIES:
        return '/sectionand/all';
      case UnderAndUpSectionServicePath.ADD:
        return '/sectionand/save';
      case UnderAndUpSectionServicePath.UPDATE:
        return '/sectionand/update';
      case UnderAndUpSectionServicePath.VIS:
        return '/sectionand/vis';
      case UnderAndUpSectionServicePath.COMPLETE:
        return '/sectionand/complete';
    }
  }
}
