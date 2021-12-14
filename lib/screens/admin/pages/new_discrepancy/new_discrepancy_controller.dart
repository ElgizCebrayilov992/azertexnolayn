import 'dart:io';

import 'package:azertexnolayn/core/constants/constants_text.dart';
import 'package:azertexnolayn/test/image_list/image_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class NewDiscrepancyController extends GetxController {
  List<MyImage> imageList = [];

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
  deleteImage(int index){
    imageList.removeAt(index);
    update();
  }
//Radio Group (TAPINTININ AÇIQLAMASI / DESCRIPTION OF FINDING)

  final List<String> findings = [
    'UYĞUNSUZLUQ',
    'POTENSİYAL UYĞ./ RİSK',
    'MÜŞAHİDƏ',
    'ÇOX ƏHƏMİYYƏTLİ',
    'AZ ƏHƏMİYYƏTLİ',
  ];
  String select = 'UYĞUNSUZLUQ';
  void onClickRadioButtonFinding(value) {
    select = value;
    update();
  }
  //Radio Group (Kok Sebeb Analizi)

  final List<String> findingsRoot = [
    AppConstantsText.yes,
    AppConstantsText.no,
  ];
  String selectRoot = AppConstantsText.no;
  void onClickRadioButtonRoot(value) {
    selectRoot = value;
    update();
  }

  var selectRaised = 'Daxili şöbə';
  List listRaised = ['Daxili şöbə', 'Subpodratçı', 'Podratçı', 'Tədarükçü'];
  void setRaised(var value) {
    selectRaised = value;
    update();
  }

  var selectApplies = 'PROSES';
  List listApplies = [
    'PROSES',
    'SİSTEM',
    'MƏHSUL',
    'UYĞUN OLMAYAN PROSEDUR/\nTƏLİMAT',
    'KEYFIYYƏT',
    'YANLIŞ TEST NƏTİCƏLƏRİ',
    'SƏTƏM'
  ];
  void setApplies(var value) {
    selectApplies = value;
    update();
  }

  var selectSection = 'KEYFIYYƏT';
  List listSection = ['KEYFIYYƏT', 'SİPRAL', 'PORTAL', 'KAPLAMA/\nQUMALAMA'];

  var selectArea = '1 ULTRASON';
  List listArea = [
    '1 ULTRASON',
    '2 ULTRASON',
    '3 ULTRASON',
    '1 İLK GÖZ',
    '2 İLK GÖZ',
    '3 İLK GÖZ',
    'RENTGEN',
  ];
  void setArea(var value) {
    selectArea = value;
    update();
  }

  void setSection(var value) {
    listArea.clear();
    selectSection = value;
    if (value == 'KEYFIYYƏT') {
      selectArea = '1 ULTRASON';
      listArea = [
        '1 ULTRASON',
        '2 ULTRASON',
        '3 ULTRASON',
        '1 İLK GÖZ',
        '2 İLK GÖZ',
        '3 İLK GÖZ',
        'RENTGEN/RENTGEN',
      ];
    }
    if (value == 'SİPRAL') {
      selectArea = '1s';
      listArea = [
        '1s',
        '2s',
        '3s',
        '4s',
      ];
    }
    if (value == 'PORTAL') {
      selectArea = '1p';
      listArea = [
        '1p',
        '2p',
        '3p',
        '4p',
      ];
    }
    if (value == 'KAPLAMA/\nQUMALAMA') {
      selectArea = '1k';
      listArea = [
        '1k',
        '2k',
        '3k',
        '4k',
      ];
    }
    update();
  }
}
