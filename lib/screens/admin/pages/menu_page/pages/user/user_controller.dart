import 'dart:io';

import 'package:azertexnolayn/core/getx_controller/user_auth_controller.dart';
import 'package:azertexnolayn/core/getx_controller/user_status_controller.dart';
import 'package:azertexnolayn/core/model/position/position_model.dart';
import 'package:azertexnolayn/core/model/user/user_model.dart';
import 'package:azertexnolayn/core/model/user_auth/user_auth_model.dart';
import 'package:azertexnolayn/core/model/user_status/user_status_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/position/position_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/section/section_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/section/section_model.dart';
import 'package:azertexnolayn/core/enum/loading_enum.dart';

class UserController extends GetxController {
  Dio dio = ProjectNetworkManager.instance.dio;
  SectionController secController = Get.find<SectionController>();
  PositionController positionController = Get.find<PositionController>();
  UserAuthController authController = Get.find<UserAuthController>();
  UserStatusController statusController = Get.find<UserStatusController>();

  String mesaj = '';
  //Section
  var loading = Loading.LOADING;
  List<UserModel> models = [];
  List<UserModel> _searchModels = [];
  UserModel model = UserModel();
  SectionModel secModel = SectionModel();
  List<SectionModel> secList = [];
  PositionModel positionModel = PositionModel();
  List<PositionModel> positionList = [];
  UserAuthModel authModel = UserAuthModel();
  List<UserAuthModel> authList = [];
  UserStatusModel statusModel = UserStatusModel();
  List<UserStatusModel> statusList = [];

  getSectionAndPositonAndAuthList() async {
    secList = await secController.fetchAllSection();
    positionList = await positionController.fetchAllPosition();
    authList = await authController.fetchAllSection();
    statusList = await statusController.fetchAllSection();
    update();
  }

  searchSection({String? sectionId}) async {
    secList;
    secModel = SectionModel();

    for (var item in secList) {
      if (item.id == sectionId) {
        secModel = item;
      }
    }
    if (secModel.id == null) {
      secModel = secList[0];
    }
  }

  searchPosition({String? sectionId}) async {
    positionList;
    positionModel = PositionModel();

    for (var item in positionList) {
      if (item.id == sectionId) {
        positionModel = item;
      }
    }
    if (positionModel.id == null) {
      positionModel = positionList[0];
    }
  }

  searchAuth({String? sectionId}) async {
    authModel = UserAuthModel();

    for (var item in authList) {
      if (item.id == sectionId) {
        authModel = item;
      }
    }
    if (authModel.id == null) {
      authModel = authList[0];
    }
  }

  searchStatus({String? sectionId}) async {
    statusModel = UserStatusModel();

    for (var item in statusList) {
      if (item.id == sectionId) {
        statusModel = item;
      }
    }
    if (statusModel.id == null) {
      statusModel = statusList[0];
    }
  }

  setSection(SectionModel? model) {
    secModel = model!;
    update();
  }

  setPosition(PositionModel? model) {
    positionModel = model!;
    update();
  }

  setAuth(UserAuthModel? model) {
    authModel = model!;
    update();
  }

  setStatus(UserStatusModel? model) {
    statusModel = model!;
    update();
  }
  //

  Future<void> fetchAllUser() async {
    print('fetchAllUser girdi');

    try {
      getSectionAndPositonAndAuthList();
      final response = await dio.get(UserServicePath.COMPLETE.rawValue);
      print(' girdi1');
      print(response);
      if (response.statusCode == HttpStatus.ok) {
        print(' girdi2');
        final data = response.data;
        print(data);
        models = [];
        _searchModels = [];
        for (var item in (data as List)) {
          print(' girdi3');
          UserModel modele = UserModel.fromJson(item);

          if (modele.status == '0') {
            print(' girdi4');
            if (_searchModels.isEmpty) {
              _searchModels.add(modele);
              print(' girdi5');
            } else {
              print(' girdi6');
              int a = 0;
              for (var item in _searchModels) {
                if (item.id == modele.id) {
                  print(' girdi7');
                  a = 1;
                }
              }
              if (a == 0) {
                print(' girdi8');
                _searchModels.add(modele);
              }
            }
          }
        }
        int a = 0;
        for (var item in _searchModels) {
          print(' girdi9');
          if (models.isEmpty) {
            print(' girdi10');
            models.add(item);
          } else {
            print(' girdi11');
            for (var model in models) {
              print(' girdi12');
              if (model.id == item.id) {
                print(' girdi13');
                a = 1;
              }
            }
            if (a == 0) {
              print(' girdi14');
              models.add(item);
            }
          }
        }

        // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
      }
      if (models.isNotEmpty) {
        print(' girdi15');
        loading = Loading.DONE;
      } else if (models.isEmpty) {
        print(' girdi16');
        loading = Loading.EMPTY;
      } else {
        print(' girdi17');
        loading = Loading.FAILED;
      }
      print('fetchAllUser bitti');
    } catch (e, s) {
      mesaj = '$e => $s';
      loading = Loading.FAILED;
    }
    print(' girdi18');
    update();
    /*

    
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
    **/
  }

  addUser(String name, String phone, String mail, String password) async {
    print('addUser girdi');
    try {
      await dio.post(
        UserServicePath.ADD.rawValue,
        data: {
          "name": name,
          "status": "0",
          "section_id": secModel.id,
          "user_status_id": statusModel.id,
          "position_id": positionModel.id,
          "mail": mail,
          "phone": phone,
          "password": password,
          "authority_id": authModel.id,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      await fetchAllUser();
      // ignore: empty_catches
    } catch (e, s) {}

    //MesajModel model = MesajModel.fromJson(post.data);
  }

  updateProfil(
      String name, String phone, String mail, String password, id) async {
    print('updateUser girdi');
    try {
      await dio.post(
        UserServicePath.PROFIL.rawValue,
        data: {
          "id": id,
          "name": name,
          "status": "0",
          "mail": mail,
          "phone": phone,
          "password": password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      // ignore: empty_catches
    } catch (e, s) {}
    model.name = name;
    model.mail = mail;
    model.phone = phone;
    model.password = password;

    update();
  }

  updateUser(
      String name, String phone, String mail, String password, id) async {
    print('updateUser girdi');
    try {
      await dio.post(
        UserServicePath.UPDATE.rawValue,
        data: {
          "id": id,
          "name": name,
          "status": "0",
          "section_id": secModel.id,
          "user_status_id": statusModel.id,
          "position_id": positionModel.id,
          "mail": mail,
          "phone": phone,
          "password": password,
          "authority_id": authModel.id,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      // ignore: empty_catches
    } catch (e, s) {}

    fetchAllUser();
  }

  visibleUser(String status, id) async {
    try {
      await dio.post(
        UserServicePath.VIS.rawValue,
        data: {"id": id, "status": status},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      fetchAllUser();
    } catch (e, s) {
      print("$e -> $s");
    }
  }

  searchUser({String text = ""}) async {
    if (text.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      fetchAllUser();
    } else {
      models = _searchModels
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

  Future<void> loginUser(String mail, String password) async {
    loading = Loading.LOADING;

    try {
      final response = await dio.post(
        UserServicePath.LOGIN.rawValue,
        data: {
          "mail": mail,
          "status": "0",
          "password": password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;

        for (var item in (data as List)) {
          model = UserModel.fromJson(item);
        }

        // models=(data as List).map((e) => RaisedModel.fromJson(e)).toList();
      }

      if (model.id == null || model.id!.isEmpty) {
        loading = Loading.EMPTY;
      } else {
        loading = Loading.DONE;
      }
      update();
    } catch (e, s) {
      print('SSSSSSSSSSSSSSSSSSSSSS');
      // print('$e => $s');
      loading = Loading.FAILED;
      mesaj = '$e ==> $s';
      update();
    }
  }
}

enum UserServicePath { APPLIES, ADD, UPDATE, VIS, COMPLETE, LOGIN, PROFIL }

extension SectionServicePathExtension on UserServicePath {
  String get rawValue {
    switch (this) {
      case UserServicePath.APPLIES:
        return '/user/all';
      case UserServicePath.LOGIN:
        return '/user/searhid';
      case UserServicePath.ADD:
        return '/user/save';
      case UserServicePath.UPDATE:
        return '/user/update';
      case UserServicePath.VIS:
        return '/user/vis';
      case UserServicePath.COMPLETE:
        return '/user/completeData';
      case UserServicePath.PROFIL:
        return '/user/updateProfil';
    }
  }
}
