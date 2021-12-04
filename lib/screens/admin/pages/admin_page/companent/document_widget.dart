import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import '../../../../../core/constants/constants_color.dart';
import 'package:date_format/date_format.dart';
import '../../../../../core/constants/constants_text.dart';
import '../../../../../core/response/responsive_layout.dart';
import '../../../../../core/timer/timer_controller.dart';
import '../../inside_document_page/inside_document_page.dart';
import '../../../../../test/messaj/mesajModel/mesaj_model.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:kartal/kartal.dart';


// ignore: must_be_immutable
class DocumentWidget extends StatelessWidget {
  TestMesaj _mesaj;
  DocumentWidget(
    this._mesaj,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>InsideDocumentPage()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(8),
            color: AppConstantsColor.compColorWhite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                sendTime(),
                const SizedBox(width: 10,),
                centerInfo(context),
                const Spacer(),
                timerOrIcon(_mesaj.timerStatus ?? 0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  centerInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 5,
        ),
        infoMesajHeader(context),
        infoMesajFrom(context),
        const SizedBox(
          height: 15,
        ),
        infoMesajTo(context),
       
        infoMesajAccept(context)
      ],
    );
  }

  Container infoMesajAccept(BuildContext context) {
    return Container(
      padding: context.horizontalPaddingLow,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black54, width: 3.0))),
      child: Row(
        children: [
          const Text(AppConstantsText.mesajAccept),
          Text(_mesaj.qebulEtdi ?? "Gözləyir..")
        ],
      ),
    );
  }

  Container infoMesajTo(BuildContext context) {
    return Container(
      padding: context.horizontalPaddingLow,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black54, width: 3.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppConstantsText.mesajTo,
          ),
          SizedBox(
            width: context.dynamicWidth(0.009),
          ),
          SizedBox(
            width: ResponsiveLayout.isPhone(context)
                ? context.dynamicWidth(0.35)
                : ResponsiveLayout.isTablet(context)
                    ? context.dynamicWidth(0.22)
                    : ResponsiveLayout.isLargeTablet(context)?context.dynamicWidth(0.17):context.dynamicWidth(0.15),
            child: ExpansionTile(
              iconColor: Colors.red,
              title: AutoSizeText(
                _mesaj.kimler![0]?.ad ?? "Gozleyir",
                
                minFontSize: 15,
                maxLines: 5,
              ),
              children: _mesaj.kimler!
                  .map((e) =>
                      Text(_mesaj.kimler![0]!.ad != e!.ad ? e.ad ?? "" : ''))
                  .toList(),
            ),
          ),
          /*
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_mesaj.kimler![0]?.ad ?? "Gozleyir"),
              IconButton(
                  onPressed: () {
                    iController.updateIsCurent();
                  },
                  icon: Icon(
                    Icons.info,
                    color: Colors.green,
                  )),
              GetBuilder<InfoCardController>(
                builder: (controller) => controller.isCurent
                    ? Card(
                        color: AppConstants.compColorBlue.withOpacity(0.5),
                        child: Column(
                          children: _mesaj.kimler!
                              .map((e) => Text(_mesaj.kimler![0]!.ad != e!.ad
                                  ? e.ad ?? ""
                                  : ''))
                              .toList(),
                        ),
                      )
                    : Text(''),
              )
            ],
          )
          */
        ],
      ),
    );
  }

  Container infoMesajFrom(BuildContext context) {
    return Container(
      padding: context.horizontalPaddingLow,
      decoration: const BoxDecoration(
        border: const Border(bottom: const BorderSide(color: Colors.black54, width: 3.0)),
      ),
      child: Row(
        children: [
          const Text(AppConstantsText.mesajFrom),
          Text(
            _mesaj.gonderen ?? "",
          ),
        ],
      ),
    );
  }

  Container infoMesajHeader(BuildContext context) {
    return Container(
      padding: context.horizontalPaddingLow,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black54, width: 3.0),
        ),
      ),
      child: Row(
        children: [
         const Text(
            AppConstantsText.mesajHeader,
          ),
          Text(
            _mesaj.basliq ?? "",
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Column sendTime() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(formatDate(DateTime.parse(_mesaj.tarix ?? '2021-12-12'), [
              yy,
              '/',
              mm,
              '/',
              d
            ])),
        Text(formatDate(DateTime.parse(_mesaj.tarix ?? '2021-12-12'), [
              HH,
              ':',
              nn,
              ':',
              ss
            ])),
      ],
    );
  }

  timerOrIcon(int timerStatus) {
    if (timerStatus == 0) {
      return TimerCountdown(
        enableDescriptions: false,
        spacerWidth: 0.5,
        format: CountDownTimerFormat.hoursMinutesSeconds,
        endTime: DateTime.now().add(
          Duration(
            hours: TimerController.getTime(_mesaj.timer ?? "").hour,
            minutes: TimerController.getTime(_mesaj.timer ?? "").minute,
            seconds: TimerController.getTime(_mesaj.timer ?? "").second,
          ),
        ),
        onEnd: () {
          print("Timer finished");
        },
      );
    } else if (timerStatus == 1) {
      return const Icon(
        Icons.alarm,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.alarm,
        color: Colors.red,
      );
    }
  }
}
/*

Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _mesaj.kimler!
                                  .map((e) => Text(
                                        ' ${e?.ad ?? ""}',
                                      ))
                                  .toList(),
                            )
*/