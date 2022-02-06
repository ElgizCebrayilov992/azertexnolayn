import 'dart:io';

import 'package:azertexnolayn/test/excel/excel_dao.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excels;

class ExcelSave {
  static toSave() async {
    ExcelDAO example = ExcelDAO(
      fileName: "Ut1EkranError",
      date: '12.02.2022',
      area: 'UT-1',
      initiator: 'Elgiz Cebrayilov',
      raised: 'Daxili sobe',
      raisedName: 'Etibar Nebiyev',
      applies: 'Mehsul',
      finding: 'Uygunsuzluq',
      initiatorDate: '12.02.2022',
      raisedDate: '14.02.2022',
      rootRequired: 'no',
      clause: 'En10584',
      rootTeam: 'Elgiz,Elmir,Elnur',
      action: 'Duzeltme',
      person: 'Etibar Zerbiyev',
      targetDate: '16.02.2022',
      compDate: '14.02.2022',
      causes: 'Avadanliq xetasi',
      accepted: 'Elgiz',
    );
    var file = "C:/Users/Elgiz/Desktop/excel/example.xlsx";
    var bytes = File(file).readAsBytesSync();
    //var excel = Excel.createExcel();
    // or
    var excel = Excel.decodeBytes(bytes);

    //Read
    var sheet = excel['sheet1'];
    var date = sheet.cell(CellIndex.indexByString('B55'));
    date.value = example.date;

    print("CellType: " + date.toString());
    print("CellType: " + date.value);
    //Save
    String outputFile = "C:/Users/Elgiz/Desktop/excel/${example.fileName}.xlsx";
    var fileBytes = excel.save();
    File(join(outputFile))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  }

  static Future<void> createExcel() async {
    final excels.Workbook workbook = excels.Workbook();
    final excels.Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = false;

    //Dizayn border qalin ici rengsiz,Bold neqativ,
    excels.Style borderEmptyColorAndNoBoldAndHLeftVTop =
        workbook.styles.add('borderEmptyColorAndNoBoldAndHLeftVTop');
    borderEmptyColorAndNoBoldAndHLeftVTop.borders.all.lineStyle =
        excels.LineStyle.thick;
    borderEmptyColorAndNoBoldAndHLeftVTop.borders.all.color = '#000000';
    borderEmptyColorAndNoBoldAndHLeftVTop.fontName = 'Times New Roman';
    borderEmptyColorAndNoBoldAndHLeftVTop.fontSize = 11;
    borderEmptyColorAndNoBoldAndHLeftVTop.hAlign = excels.HAlignType.left;
    borderEmptyColorAndNoBoldAndHLeftVTop.vAlign = excels.VAlignType.top;
    //image
    excels.Style imageStyle = workbook.styles.add('image');
    imageStyle.borders.all.lineStyle = excels.LineStyle.thick;

    imageStyle.borders.all.color = '#000000';
    sheet.getRangeByName('A1:A4').cellStyle = imageStyle;
    sheet.getRangeByName('A1').columnWidth = 21.71;
    final excels.Range image = sheet.getRangeByName('A1:A4');

    final List<int> bytes4 =
        File('C:\\Users\\Elgiz\\Desktop\\excel\\excellogo.jpg')
            .readAsBytesSync();

    final excels.Picture picture = sheet.pictures.addStream(1, 1, bytes4);

    image.merge();

    //report
    sheet
        .getRangeByName('B1')
        .setText('UYĞUNSUZLUQ HESABATI \nNONCONFORMITY REPORT');

    excels.Style reportStyle = workbook.styles.add('report');

    reportStyle.borders.all.lineStyle = excels.LineStyle.thick;
    reportStyle.fontSize = 16;
    reportStyle.borders.all.color = '#000000';
    reportStyle.bold = true;
    reportStyle.fontName = 'Times New Roman';
    reportStyle.hAlign = excels.HAlignType.center;

    reportStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('B1:E4').cellStyle = reportStyle;
    reportStyle.wrapText = true;
    sheet.getRangeByName('B1').columnWidth = 21.86;
    sheet.getRangeByName('C1').columnWidth = 38.86;
    sheet.getRangeByName('D1').columnWidth = 20.00;
    sheet.getRangeByName('E1').columnWidth = 18.29;
    final excels.Range report = sheet.getRangeByName('B1:E4');
    report.merge();

    //info
    excels.Style info = workbook.styles.add('info');

    info.borders.all.lineStyle = excels.LineStyle.thick;

    info.borders.all.color = '#000000';

    info.fontName = 'Times New Roman';

    sheet.getRangeByName('F1:G4').cellStyle = info;

    sheet.getRangeByName('F1:F7').columnWidth = 17.00;
    sheet.getRangeByName('F1').setText('Doc. No.:');
    sheet.getRangeByName('F2').setText('Issue date:');
    sheet.getRangeByName('F3').setText('Rev. No.:');
    sheet.getRangeByName('F4').setText('Rev. date:');
    sheet.getRangeByName('G1').setText('ATL-QMS-F-009');
    sheet.getRangeByName('G2').setText('19.11.2013');
    sheet.getRangeByName('G3').setText('04');
    sheet.getRangeByName('G4').setText('10.10.2017');
    sheet.getRangeByName('G1:G6').columnWidth = 26.71;

    //date, area initator,raised,applies,other,name
    excels.Style area = workbook.styles.add('area');
    area.borders.all.lineStyle = excels.LineStyle.thick;
    area.borders.all.color = '#000000';
    area.bold = true;
    area.fontName = 'Times New Roman';
    sheet.getRangeByName('A5:A7').cellStyle = area;
    sheet.getRangeByName('A5:A7').cellStyle.backColor = '#d9d9d9';

    sheet.getRangeByName('A8:A11').cellStyle = area;

    sheet.getRangeByName('A5').setText('Tarix / Date:');
    sheet.getRangeByName('A6').setText('Sahə / Area:');
    sheet.getRangeByName('A7').setText('Aşkarlayan / Initiator:');
    //
    final excels.Range raised2 = sheet.getRangeByName('A8');
    raised2.setText('Aidiyyatı / Raised to:');
    raised2.cellStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('A8:A9').merge();

    final excels.Range applies = sheet.getRangeByName('A10');
    applies.setText('Tətbiq olunacaq /\nApplies to:');
    applies.cellStyle.wrapText = true;

    final excels.Range others = sheet.getRangeByName('A11');
    others.setText('Digərləri / Others:');
    others.cellStyle.vAlign = excels.VAlignType.center;

    sheet.getRangeByName('A5:A11').columnWidth = 21.71;

    sheet.getRangeByName('A10:A11').rowHeight = 30;
    //
    sheet.getRangeByName('C9').setText('Bura yazilacaq');
    sheet.getRangeByName('C9:G9').merge();

    excels.Style dateStyle = workbook.styles.add('dateStyle');
    dateStyle.borders.all.lineStyle = excels.LineStyle.thick;
    dateStyle.borders.all.color = '#000000';

    sheet.getRangeByName('B5:G11').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;

    sheet.getRangeByName('B9').cellStyle = area;
    sheet.getRangeByName('B9').setText('Ad/Name:');
    sheet.getRangeByName('B9').cellStyle.backColor = '#d9d9d9';
    //
    sheet.getRangeByName('B5').setText('Bura yazilacaq');
    sheet.getRangeByName('B5:E5').merge();
    //
    sheet.getRangeByName('B6').setText('Bura yazilacaq');
    sheet.getRangeByName('B6:E6').merge();
    //
    sheet.getRangeByName('B7').setText('Bura yazilacaq');
    sheet.getRangeByName('B7:G7').merge();
    //
    //
    sheet.getRangeByName('B8').setText('Bura yazilacaq');
    sheet.getRangeByName('B8:G8').merge();
    //
    sheet.getRangeByName('B10').setText('Bura yazilacaq');
    sheet.getRangeByName('B10:G10').merge();
    //
    sheet.getRangeByName('B11').setText('Bura yazilacaq');
    sheet.getRangeByName('B11:G11').merge();
    excels.Style findingStyle = workbook.styles.add('findingStyle');
    findingStyle.borders.all.lineStyle = excels.LineStyle.thick;
    findingStyle.borders.all.color = '#000000';
    findingStyle.bold = true;
    findingStyle.fontColor = '#ffffff';
    sheet.getRangeByName('A12:G12').merge();
    sheet.getRangeByName('A12:G12').cellStyle = findingStyle;
    sheet.getRangeByName('A12:G12').cellStyle.backColor = '#808080';
    sheet
        .getRangeByName('A12')
        .setText('TAPINTININ AÇIQLAMASI / DESCRIPTION OF FINDING');
    //
    sheet.getRangeByName('A13:F14').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('A13').setText('Bura yazilacaq');
    sheet.getRangeByName('A13:F14').merge();
    //
    sheet.getRangeByName('A15:F20').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('A15').setText('Bura yazilacaq');
    sheet.getRangeByName('A15:F20').merge();
    //
    sheet.getRangeByName('G13:G14').cellStyle = dateStyle;
    sheet
        .getRangeByName('G13')
        .setText('Standart və Maddə № \nStandard & Clause#');
    sheet.getRangeByName('G13').cellStyle.hAlign = excels.HAlignType.center;
    sheet.getRangeByName('G13').cellStyle.wrapText = true;
    sheet.getRangeByName('G13').cellStyle.bold = true;
    sheet.getRangeByName('G13:G14').merge();
    //
    sheet.getRangeByName('G15:G20').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('G15').setText('Bura yazilacaq');
    sheet.getRangeByName('G15:G20').merge();

    //
    excels.Style style7 = workbook.styles.add('style77');
    style7.backColor = '#d9d9d9';
    style7.wrapText = true;
    style7.bold = true;
    style7.fontSize = 11;
    style7.fontName = 'Times New Roman';
    style7.borders.all.lineStyle = excels.LineStyle.thick;
    style7.borders.all.color = '#000000';
    sheet.getRangeByName('A21').rowHeight = 30;
    sheet.getRangeByName('A21:B21').cellStyle = style7;
    sheet.getRangeByName('A21').setText(
        'Aşkarlayan / Initiator \n(ad,soyad,imza,tarix/name,signature,date):');
    sheet.getRangeByName('A21:B21').merge();
    //

    sheet.getRangeByName('C21').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('C21').setText('Bura yazilacaq');
    //

    sheet.getRangeByName('D21:E21').cellStyle.wrapText = true;
    sheet.getRangeByName('D21:E21').cellStyle.bold = true;
    sheet.getRangeByName('D21:E21').setText(
        'Aidiyyatı / Raised to \n(ad,soyad,imza,tarix/name,signature,date):');
    sheet.getRangeByName('D21:E21').cellStyle.borders.all.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('D21:E21').cellStyle.borders.all.color = '#000000';
    sheet.getRangeByName('D21:E21').merge();
    //

    sheet.getRangeByName('F21:G21').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('F21:G21').setText('Bura yazilacaq');
    sheet.getRangeByName('F21:G21').merge();
    //
    sheet.getRangeByName('A22:G22').merge();
    sheet.getRangeByName('A22:G22').cellStyle = findingStyle;
    sheet.getRangeByName('A22:G22').cellStyle.backColor = '#808080';
    sheet
        .getRangeByName('A22')
        .setText('KÖK SƏBƏB ANALİZİ / ROOT CAUSE ANALYSIS (RCA)');
    //
    sheet.getRangeByName('A31:G31').merge();
    sheet.getRangeByName('A31:G31').cellStyle = findingStyle;
    sheet.getRangeByName('A31:G31').cellStyle.backColor = '#808080';
    sheet.getRangeByName('A31').setText(
        'DÜZƏLTMƏ / DÜZƏLDİCİ TƏDBİR / CORRECTION / CORRECTIVE  ACTION');
    //
    sheet.getRangeByName('A41:G41').merge();
    sheet.getRangeByName('A41:G41').cellStyle = findingStyle;
    sheet.getRangeByName('A41:G41').cellStyle.backColor = '#808080';
    sheet
        .getRangeByName('A41')
        .setText('YENİLƏNMİŞ SƏNƏDLƏR / DOCUMENTS REVISED');
    //
    sheet.getRangeByName('A46:G46').merge();
    sheet.getRangeByName('A46:G46').cellStyle = findingStyle;
    sheet.getRangeByName('A46:G46').cellStyle.backColor = '#808080';
    sheet.getRangeByName('A46').setText('ƏLAVƏLƏR / ATTACHMENTS');
    //
    sheet.getRangeByName('A51:G51').merge();
    sheet.getRangeByName('A51:G51').cellStyle = findingStyle;
    sheet.getRangeByName('A51:G51').cellStyle.backColor = '#808080';
    sheet.getRangeByName('A51').setText('BAĞLANIŞ / CLOSURE');
    //
    sheet.getRangeByName('A23').cellStyle.bold = true;
    sheet.getRangeByName('A23').cellStyle.wrapText = true;
    sheet.getRangeByName('A23').cellStyle.backColor = '#d9d9d9';
    sheet.getRangeByName('A23').rowHeight = 27;
    sheet.getRangeByName('A23').setText('Tələb olunur? \n Required?');
    sheet.getRangeByName('A23:A37').cellStyle.borders.left.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('A23:A37').cellStyle.borders.all.color = '#000000';
    //G23
    sheet.getRangeByName('B23').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('B23').cellStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('B23').setText('Bura Yazilacaq');
    sheet.getRangeByName('G23:G29').cellStyle.borders.right.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('G23:G29').cellStyle.borders.all.color = '#000000';
    sheet.getRangeByName('B23:G23').merge();
    //
    sheet.getRangeByName('A24').cellStyle.bold = true;

    sheet.getRangeByName('A24').setText('Səbəblər / Causes');

    //
    sheet.getRangeByName('B24').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('B24').cellStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('B24').setText('Bura Yazilacaq');
    sheet.getRangeByName('B24:G24').merge();
    //

    sheet.getRangeByName('A25').cellStyle.bold = true;

    sheet.getRangeByName('A25').setText('digər / other:');

    //
    sheet.getRangeByName('B25').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('B25').cellStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('B25').setText('Bura Yazilacaq');
    sheet.getRangeByName('B25:G25').merge();
    //
    sheet.getRangeByName('A26').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('A26').cellStyle.vAlign = excels.VAlignType.top;
    sheet.getRangeByName('A26').setText('Bura Yazilacaq');
    sheet.getRangeByName('A26:G29').merge();
    //
    sheet.getRangeByName('A30').rowHeight = 30;
    sheet.getRangeByName('A30:B30').cellStyle = style7;
    sheet.getRangeByName('A30').setText(
        'Kök səbəb analiz komanda üzvləri \n Root Cause Analyse Team members:');
    sheet.getRangeByName('A30:B30').merge();
    //

    sheet.getRangeByName('C30:G30').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('C30').setText('Bura Yazilacaq');
    sheet.getRangeByName('C30:G30').merge();
    //
    sheet.getRangeByName('A32').cellStyle.bold = true;
    sheet.getRangeByName('A32').cellStyle.backColor = '#d9d9d9';
    sheet.getRangeByName('A32').rowHeight = 30;
    sheet.getRangeByName('A32').setText('Növü / Type');
    sheet.getRangeByName('A32').cellStyle.borders.left.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('A32').cellStyle.borders.all.color = '#000000';
    //
    sheet.getRangeByName('B32').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('B32').cellStyle.vAlign = excels.VAlignType.center;
    sheet.getRangeByName('B32').setText('Bura Yazilacaq');

    //
    sheet.getRangeByName('C32:F32').merge();
    sheet.getRangeByName('C32').cellStyle.hAlign = excels.HAlignType.center;
    sheet
        .getRangeByName('C32:F32')
        .setText('(ƏGƏR KÖK SƏBƏB ANALİZİ TƏLƏB OLUNURSA / IF RCA REQUIRED)');
    //
    sheet.getRangeByName('A33').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('A33').cellStyle.vAlign = excels.VAlignType.top;
    sheet.getRangeByName('A33').setText('Bura Yazilacaq');
    sheet.getRangeByName('A33:F37').merge();
    //
    sheet.getRangeByName('G32').rowHeight = 30;
    sheet.getRangeByName('G32').cellStyle = style7;
    sheet.getRangeByName('G32').setText('TƏYİN OLUNAN ŞƏXS \nASSIGNED PERSON');
    //

    sheet.getRangeByName('G33').rowHeight = 30;

    sheet.getRangeByName('G33').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('G33').setText('Bura Yazilacaq');
    //
    sheet.getRangeByName('G34').rowHeight = 30;
    sheet.getRangeByName('G34').cellStyle = style7;
    sheet
        .getRangeByName('G34')
        .setText('HƏDƏF BİTMƏ TARİXİ \nTARGET COMP. DATE');
    //

    sheet.getRangeByName('G35').rowHeight = 30;

    sheet.getRangeByName('G35').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('G35').setText('Bura Yazilacaq');
    //
    sheet.getRangeByName('G36').rowHeight = 30;
    sheet.getRangeByName('G36').cellStyle = style7;
    sheet.getRangeByName('G36').setText('BİTMƏ TARİXİ \nCOMPLETION DATE');
    //

    sheet.getRangeByName('G37').rowHeight = 30;

    sheet.getRangeByName('G37').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('G37').setText('Bura Yazilacaq');
    //
    sheet.getRangeByName('A38').rowHeight = 30;
    sheet.getRangeByName('A38').cellStyle.bold = true;
    sheet.getRangeByName('A38').cellStyle.wrapText = true;
    sheet.getRangeByName('A38').cellStyle.backColor = '#d9d9d9';
    sheet.getRangeByName('A38').setText('DT Qəbul olundu \nCA Accepted: ');
    sheet.getRangeByName('A38').cellStyle.borders.left.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('A38').cellStyle.vAlign = excels.VAlignType.top;
    sheet.getRangeByName('A38').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('A38').cellStyle.borders.top.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('A38').cellStyle.borders.all.color = '#000000';
    //
    sheet.getRangeByName('B38').cellStyle.hAlign = excels.HAlignType.left;
    sheet.getRangeByName('B38').cellStyle.vAlign = excels.VAlignType.top;
    sheet.getRangeByName('B38').cellStyle.borders.top.lineStyle =
        excels.LineStyle.thick;
    sheet.getRangeByName('B38').cellStyle.borders.all.color = '#000000';
    sheet.getRangeByName('B38').setText('Bura yazilacaq ');
    //

    sheet.getRangeByName('C38').cellStyle = style7;
    sheet
        .getRangeByName('C38')
        .setText('Əgər YOX, Səbəb göstər \nIf NO, Provide reason:');
    //

    sheet.getRangeByName('D38:G38').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;

    sheet.getRangeByName('D38').setText('Bura yazilacaq');
    sheet.getRangeByName('D38:G38').merge();
    //
    sheet.getRangeByName('A39:B39').cellStyle = style7;
    sheet.getRangeByName('A39').rowHeight = 30;
    sheet.getRangeByName('A39').setText(
        'İzlənilmə qeydləri / Follow-up notes\n(DT effektivdir? / CA effective?):');
    sheet.getRangeByName('A39:B39').merge();
    //

    sheet.getRangeByName('C39').setText('Bura yazilacaq');

    sheet.getRangeByName('C39:G39').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('C39:G39').merge();
    //
    sheet.getRangeByName('A40:B40').cellStyle = style7;
    sheet.getRangeByName('A40').rowHeight = 30;
    sheet.getRangeByName('A40').setText(
        'Doğruladı (ad, imza, tarix)\nVerified by (name, signature, date):');
    sheet.getRangeByName('A40:B40').merge();
    //

    sheet.getRangeByName('C40').setText('Bura yazilacaq');
    sheet.getRangeByName('C40:G40').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('C40:G40').merge();
    //

    sheet.getRangeByName('A42').setText('Bura yazilacaq');

    sheet.getRangeByName('A42:G45').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('A42:G45').merge();
    //
    sheet.getRangeByName('A47').setText('Bura yazilacaq');
    sheet.getRangeByName('A47:G50').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;

    sheet.getRangeByName('A47:G50').merge();
    //
    sheet.getRangeByName('A52:C52').cellStyle = style7;
    sheet.getRangeByName('A52').rowHeight = 30;
    sheet.getRangeByName('A52').setText(
        'KİS mütəxəssisi tərəfindən doğrulandı (ad, imza, tarix)\nVerified by QMS Personnel (name, signature, date):');
    sheet.getRangeByName('A52:C52').merge();
    //
    sheet.getRangeByName('D52').setText('Bura yazilacaq');
    sheet.getRangeByName('D52:G52').cellStyle =
        borderEmptyColorAndNoBoldAndHLeftVTop;
    sheet.getRangeByName('D52:G52').merge();
    //Save
    final List<int> bytes = workbook.saveAsStream();

    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = Platform.isWindows
        ? 'C:\\Users\\Elgiz\\Desktop\\excel\\elgiz.xlsx'
        : '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
     OpenFile.open(fileName);
  }

  //Example

}
