import 'dart:convert';
import 'dart:io';
import 'package:azertexnolayn/core/enum/loading_enum.dart';
import 'package:azertexnolayn/core/model/applies/applies_model.dart';
import 'package:azertexnolayn/core/model/finding/finding_model.dart';
import 'package:azertexnolayn/core/model/section/section_model.dart';
import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/core/model/raised/raised_model.dart';
import 'package:azertexnolayn/core/model/section_up_and_under/section_up_and_under.dart';
import 'package:azertexnolayn/core/model/undersection/undersection_model.dart';
import 'package:azertexnolayn/core/model/user/user_model.dart';
import 'package:azertexnolayn/core/network/project_network_manager.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/applies/applies_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/finding/finding_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/raised/raised_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/section/section_controller.dart';
import 'package:azertexnolayn/screens/admin/pages/menu_page/pages/user/user_controller.dart';
import 'package:azertexnolayn/test/image_list/image_list.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:azertexnolayn/core/model/inconsistency/inconsistency_model.dart';

class NewDiscrepancyController extends GetxController {
  String test = '00';
  Loading loading = Loading.LOADING;
  List<InconsistencyModel> inconsistencyList = [];
  List<InconsistencyModel> inconsistencyList2 = [];
  List<InconsistencyModel> inconsistencyListComeWriter = [];
  List<InconsistencyModel> inconsistencyListRaised = [];
  List<InconsistencyModel> inconsistencyListCorrective = [];
  List<InconsistencyModel> inconsistencyListCorrectiv = [];
  List<InconsistencyModel> inconsistencyListEtiraz = [];
  List<InconsistencyModel> inconsistencyListWaitingAccept = [];
  List<InconsistencyModel> inconsistencyListClossed = [];
  List<InconsistencyModel> inconsistencyCreaterListClossed = [];
  List<InconsistencyModel> inconsistencyCreaterListProses = [];
  List<InconsistencyModel> inconsistencyCreaterListAccept = [];
  List<InconsistencyModel> inconsistencyCreaterListTeyin = [];
  List<InconsistencyModel> inconsistencyCreaterListEtiraz = [];
  List<InconsistencyModel> inconsistencyCreaterListWaitingAcept = [];
  Dio dio = ProjectNetworkManager.instance.dio;
  UserController userController = Get.find<UserController>();
  RaisedController raisedController = Get.find<RaisedController>();
  AppliesController appliesController = Get.find<AppliesController>();
  List<AppliesModel> appliesList = [];
  AppliesModel? appliesModel = AppliesModel();
  List<UserModel> userAddModelList = [];
  List<UserModel> results = [];
  List<UserModel> userModelListTest = [];
  List<MyImage> imageList = [];
  final List<String> findingsRoot = [
    AppConstantsText.yes,
    AppConstantsText.no,
  ];
  String selectRoot = AppConstantsText.no;
  List<RaisedModel> raisedList = [];
  RaisedModel? raisedModel = RaisedModel();

  List<SectionModel> sectionList = [];
  SectionModel? sectionModel = SectionModel();
  List<UndersectionModel> underList = [];
  UndersectionModel? underModel = UndersectionModel();
  SectionController sectionController = Get.find<SectionController>();
  List<SectionUpAndUnder> _upAndUnderList = [];

  FindingController findingController = Get.find<FindingController>();
  List<FindingModel> findingList = [];
  FindingModel? findingModel = FindingModel();
  //
  getUser() async {
    await findingController.fetchAllFinding();
    findingList = findingController.models;
    findingModel = findingList[0];
    await appliesController.fetchAllApplies();
    appliesList = appliesController.models;
    appliesModel = appliesList[0];
    await userController.fetchAllUser();
    userModelListTest = userController.models;
    await raisedController.fetchAllRaiseds();
    raisedList = raisedController.models;

    raisedModel = raisedList[0];
    await sectionController.fetchAllSection();
    sectionList = sectionController.searchModels;
    sectionModel = sectionList[0];
    await sectionController.fetchAllUnAndUpSection();
    _upAndUnderList = sectionController.unAndUpModels;
    for (var item in _upAndUnderList) {
      if (item.status == '0') {
        if (item.section_id == sectionModel?.id) {
          underList.add(UndersectionModel(
              id: item.undersection_id,
              name: item.undersection_name,
              status: item.undersection_status));
        }
      }
    }
    underModel = underList[0];
    update();
  }

  void runFilter({String enteredKeyword = ''}) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = userModelListTest;
    } else {
      results = userModelListTest
          .where((element) => element.name!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    update();
  }

  void addUser(UserModel userModel) {
    userAddModelList.add(userModel);
    results.remove(userModel);
    for (var item in userAddModelList) {
      print(item.name);
    }
    update();
  }

  void deleteUser(UserModel userModel) {
    userAddModelList.remove(userModel);
    results.add(userModel);
    for (var item in userAddModelList) {
      print(item.name);
    }
    update();
  }

  // Add İmage

  uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      File file = File(result.files.single.path ?? "");

      imageList.add(MyImage(path: file.path));

      imageCache?.clear();
    } else {
      // User canceled the picker
    }
    update();
  }

  deleteImage(int index) {
    imageList.removeAt(index);
    update();
  }

  //Radio Group (Kok Sebeb Analizi)

  void onClickRadioButtonRoot(value) {
    selectRoot = value;
    update();
  }

  setRaised(RaisedModel? value) {
    raisedModel = value;
    update();
  }

  setSection(SectionModel? value) {
    sectionModel = value;
    underList.clear();
    for (var item in _upAndUnderList) {
      if (item.status == '0') {
        if (item.section_id == sectionModel?.id) {
          print(item.undersection_name);
          underList.add(UndersectionModel(
              id: item.undersection_id,
              name: item.undersection_name,
              status: item.undersection_status));
        }
      }
    }
    if (underList.isEmpty) {
      underModel = UndersectionModel();
    } else {
      underModel = underList[0];
    }
    print(value?.name);
    print(underModel?.name);
    update();
  }

  setUnderSection(UndersectionModel? value) {
    underModel = value;
    update();
  }

  setApplies(AppliesModel? value) {
    appliesModel = value;
    update();
  }

  setFinding(FindingModel? value) {
    findingModel = value;
    update();
  }

  createKis({
    required String raised_id,
    required String applies_id,
    String ncr = "",
    String ca = "",
    required String moc,
    required String title,
    required String whoms,
    required String create_date,
    required String section_id,
    required String under_section_id,
    required String create_user_id,
    required String finding_id,
    required String finding_desc,
    required String clause,
    required String root,
    required String counter,
    required String counter_end_date,
    required String situation,
    required String status,
  }) async {
    try {
      var response = await dio.post(
        NewDiscrepancyServicePath.createKis.rawValue,
        data: {
          "raised_id": raised_id,
          "applies_id": applies_id,
          "ncr": ncr,
          "ca": ca,
          "moc": moc,
          "title": title,
          "whoms": whoms,
          "create_date": create_date,
          "section_id": section_id,
          "under_section_id": under_section_id,
          "create_user_id": create_user_id,
          "finding_id": finding_id,
          "finding_desc": finding_desc,
          "clause": clause,
          "root": root,
          "counter": counter,
          "counter_end_date": counter_end_date,
          "situation": situation,
          "kis_send_raised_date": create_date,
          "status": status,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json,
            validateStatus: (_) => true),
      );
    } catch (e, s) {}
  }

  createWriter({
    required String create_date,
    required String section_id,
    required String under_section_id,
    required String create_user_id,
    required String finding_id,
    required String finding_desc,
    required String clause,
    required String root,
    required String counter,
    required String counter_end_date,
    required String situation,
    required String status,
  }) async {
    try {
      var response = await dio.post(
        NewDiscrepancyServicePath.create.rawValue,
        data: {
          "create_date": create_date,
          "section_id": section_id,
          "under_section_id": under_section_id,
          "create_user_id": create_user_id,
          "finding_id": finding_id,
          "finding_desc": finding_desc,
          "clause": clause,
          "root": root,
          "counter": counter,
          "counter_end_date": counter_end_date,
          "situation": situation,
          "kis_send_raised_date": create_date,
          "status": status,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json,
            validateStatus: (_) => true),
      );
    } catch (e, s) {}
  }

  Stream<int> getListStreamInconsistency() async* {
    yield* Stream.periodic(const Duration(seconds: 5), (_) async {
      return await _checkList();
    }).asyncMap((event) async => await event);
  }

  int a = 1;
  Future<int> _checkList() async {
    //inconsistencyList

    try {
      final response = await dio.get(NewDiscrepancyServicePath.all.rawValue);

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
     
        if ((jsonDecode(data) as List).isEmpty) {
       
        } else {
        
          inconsistencyList.clear();
          inconsistencyList2.clear();
          for (var item in (jsonDecode(data) as List)) {
            InconsistencyModel modele = InconsistencyModel.fromJson(item);

            if (modele.status == '0') {
              if (inconsistencyList2.isEmpty) {
                inconsistencyList2.add(modele);
              } else {
                int a = 0;
                for (var item in inconsistencyList2) {
                  if (item.id == modele.id) {
                    a = 1;
                  }
                }
                if (a == 0) {
                  inconsistencyList2.add(modele);
                }
              }
            }
          }
//

          int b = 0;
          for (var item in inconsistencyList2) {
            if (inconsistencyList.isEmpty) {
              inconsistencyList.add(item);
            } else {
              for (var model in inconsistencyList) {
                if (model.id == item.id) {
                  b = 1;
                }
              }

              if (b == 0) {
                inconsistencyList.add(item);
              }
            }
          }
          if (inconsistencyList.isNotEmpty) {
            loading = Loading.DONE;
          } else if (inconsistencyList.isEmpty) {
            loading = Loading.EMPTY;
          } else {
            loading = Loading.FAILED;
          }
          userController.model.authority_id == '3' ? _getCreaterList() : null;
          userController.model.authority_id == '2' ? _getKisList() : null;
        }
        //

      }

      update();
    } catch (e, s) {}

    return 1;
  }

  Loading loadingProsses = Loading.LOADING;
  Loading loadingAccept = Loading.LOADING;
  Loading loadingTeyin = Loading.LOADING;
  Loading loadingEtiraz = Loading.LOADING;
  Loading loadingWaitingAccept = Loading.LOADING;
  Loading loadingClosed = Loading.LOADING;
  Loading loadingNew = Loading.EMPTY;
  _getCreaterList() {
    inconsistencyCreaterListProses.clear();
    inconsistencyCreaterListAccept.clear();
    inconsistencyCreaterListTeyin.clear();
    inconsistencyCreaterListEtiraz.clear();
    inconsistencyCreaterListWaitingAcept.clear();
    inconsistencyCreaterListClossed.clear();
 
    for (var item in inconsistencyList) {
  
      if (userController.model.id == item.create_user_id &&
          (item.situation == '15' ||
              item.situation == '5' ||
              item.situation == '13')) {
        inconsistencyCreaterListAccept.add(item);
        loadingAccept = Loading.DONE;
      } else if (userController.model.id == item.create_user_id &&
          item.situation == '17') {
        inconsistencyCreaterListEtiraz.add(item);
        loadingEtiraz = Loading.DONE;
      } else if (userController.model.id == item.accept_raised_id &&
          item.situation == '18') {
        inconsistencyCreaterListEtiraz.add(item);
        loadingEtiraz = Loading.DONE;
      } else if (userController.model.id == item.person_id &&
          item.situation == '19') {
        inconsistencyCreaterListEtiraz.add(item);
        loadingEtiraz = Loading.DONE;
      } else if (userController.model.id == item.corrective_user_id &&
          item.situation == '20') {
        inconsistencyCreaterListEtiraz.add(item);
        loadingEtiraz = Loading.DONE;
      } else if (userController.model.id == item.create_user_id &&
          item.situation == '7') {
        inconsistencyCreaterListWaitingAcept.add(item);
        loadingWaitingAccept = Loading.DONE;
      } else if (userController.model.id == item.accept_raised_id &&
          item.situation == '9') {
        inconsistencyCreaterListWaitingAcept.add(item);
        loadingWaitingAccept = Loading.DONE;
      } else if (userController.model.id == item.create_user_id &&
          item.situation == '11') {
        inconsistencyCreaterListClossed.add(item);
        loadingClosed = Loading.DONE;
      } else if (userController.model.id == item.corrective_user_id &&
          item.situation == '12') {
        inconsistencyCreaterListTeyin.add(item);
        loadingTeyin = Loading.DONE;
      } else if (userController.model.id == item.accept_raised_id &&
          item.situation == '4') {
        inconsistencyCreaterListTeyin.add(item);
        loadingTeyin = Loading.DONE;
      } else if (userController.model.id == item.create_user_id &&
          (item.situation != '4' ||
              item.situation != '12' ||
              item.situation != '17' ||
              item.situation != '18' ||
              item.situation != '19' ||
              item.situation != '20' ||
              item.situation != '9' ||
              item.situation != '7' ||
              item.situation != '11')) {
        inconsistencyCreaterListProses.add(item);
        loadingProsses = Loading.DONE;
      }
    }

    if (inconsistencyCreaterListProses.isEmpty) {
      loadingProsses = Loading.EMPTY;
    }
    if (inconsistencyCreaterListAccept.isEmpty) {
      loadingAccept = Loading.EMPTY;
    }
    if (inconsistencyCreaterListClossed.isEmpty) {
      loadingClosed = Loading.EMPTY;
    }
    if (inconsistencyCreaterListEtiraz.isEmpty) {
      loadingEtiraz = Loading.EMPTY;
    }
    if (inconsistencyCreaterListTeyin.isEmpty) {
      loadingTeyin = Loading.EMPTY;
    }
    if (inconsistencyCreaterListWaitingAcept.isEmpty) {
      loadingWaitingAccept = Loading.EMPTY;
    }
  }

  _getKisList() {
    inconsistencyListClossed.clear();
    inconsistencyListComeWriter.clear();
    inconsistencyListCorrectiv.clear();
    inconsistencyListCorrective.clear();
    inconsistencyListEtiraz.clear();
    inconsistencyListRaised.clear();
    inconsistencyListWaitingAccept.clear();

    for (var item in inconsistencyList) {
      if (item.situation == '1') {
        inconsistencyListComeWriter.add(item);
      } else if (item.situation == '3') {
        inconsistencyListRaised.add(item);
      } else if (item.situation == '25') {
        inconsistencyListCorrectiv.add(item);
      } else if (item.situation == '16' ||
          item.situation == '21' ||
          item.situation == '22' ||
          item.situation == '23' ||
          item.situation == '17' ||
          item.situation == '18' ||
          item.situation == '19' ||
          item.situation == '20') {
        inconsistencyListEtiraz.add(item);
      } else if (item.situation == '8' ||
          item.situation == '6' ||
          item.situation == '10' ||
          item.situation == '14' ||
          item.situation == '24') {
        inconsistencyListWaitingAccept.add(item);
      } else if (item.situation == '11') {
        inconsistencyListClossed.add(item);
      }
    }
  }
  counterUpdate(InconsistencyModel model,String index) async {
try {
      await dio.post(
        NewDiscrepancyServicePath.counterUpdate.rawValue,
        data: {"id": model.id, "counter": index},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e, s) {
      print("$e -> $s");
    }
    update();
  }
}

enum NewDiscrepancyServicePath { createKis, createKisUpdate, all, create,counterUpdate }

extension NewDiscrepancyServicePathExtension on NewDiscrepancyServicePath {
  String get rawValue {
    switch (this) {
      case NewDiscrepancyServicePath.createKis:
        return '/inconsistency/createKis';
      case NewDiscrepancyServicePath.createKisUpdate:
        return '/inconsistency/createKisUpdate';
      case NewDiscrepancyServicePath.all:
        return '/inconsistency/all';
      case NewDiscrepancyServicePath.create:
        return '/inconsistency/create';
      case NewDiscrepancyServicePath.counterUpdate:
        return '/inconsistency/counterController';
    }
  }
}
