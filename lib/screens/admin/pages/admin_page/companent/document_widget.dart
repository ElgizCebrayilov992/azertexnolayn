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
  final TestMesaj _mesaj;
  const DocumentWidget(
    this._mesaj,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => InsideDocumentPage()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sendTime(context),
                const SizedBox(
                  width: 10,
                ),
                centerInfo(context),
                ResponsiveLayout.isPhone(context)
                    ? const SizedBox()
                    : timerOrIcon(_mesaj.timerStatus ?? 0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  centerInfo(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
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
        ),
      ),
    );
  }

  Container infoMesajAccept(BuildContext context) {
    return Container(
     
      padding: context.horizontalPaddingLow,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black54, width: 3.0))),
      child: Wrap(
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
      child: Wrap(
        children: [
          const Text(
            AppConstantsText.mesajTo,
          ),
          SizedBox(
            width: context.dynamicWidth(0.009),
          ),
          Wrap(
            children: _mesaj.kimler!
                .map(
                  (e) => Chip(
                    deleteButtonTooltipMessage: AppConstantsText.delete,
                    deleteIcon: const Icon(Icons.close),
                    deleteIconColor: AppConstantsColor.adminColorRed,
                    label: Text(e?.ad ?? ""),
                    backgroundColor: Colors.grey.shade200,
                  ),
                )
                .toList(),
          ),
          /*
Text(_mesaj.kimler![0]!.ad != e!.ad ? e.ad ?? "" : '')






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
        border: Border(bottom: BorderSide(color: Colors.black54, width: 3.0)),
      ),
      child: Wrap(
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
      child: Wrap(
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

  Column sendTime(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(formatDate(DateTime.parse(_mesaj.tarix ?? '2021-12-12'),
            [yy, '/', mm, '/', d])),
        Text(formatDate(DateTime.parse(_mesaj.tarix ?? '2021-12-12'),
            [HH, ':', nn, ':', ss])),
        const Divider(
          color: Colors.black,
          height: 3,
        ),
        ResponsiveLayout.isPhone(context)
            ? timerOrIcon(_mesaj.timerStatus ?? 0)
            : const SizedBox()
      ],
    );
  }

  timerOrIcon(int timerStatus) {
    if (timerStatus == 0) {
      return const Text('24:00:00');
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
  //TODO Bunu timerde qoyacaqsan
  /*
  TimerCountdown(
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
      )
  */
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