import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:azertexnolayn/core/model/inconsistency/inconsistency_model.dart';

// ignore: must_be_immutable
class DocumentWidget extends StatelessWidget {
  NewDiscrepancyController controller=Get.find<NewDiscrepancyController>();
  final InconsistencyModel model;
   DocumentWidget(
    this.model, {Key? key}
  ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                boldAndSimpleText(title: 'Başlıq: ', info: model.title!),
                boldAndSimpleText(
                    title: 'Göndərən: ', info: model.create_user_name!),
                boldAndSimpleText(title: 'Kimlər: ', info: model.whoms!),
                boldAndSimpleText(
                    title: 'Qəbul eden: ', info: model.accept_raised_name!),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text('Göndərilmə vaxtı: ',  style:  TextStyle(fontWeight: FontWeight.bold),),
                        sendTime(context)
                      ],
                    ),
                  ),
                ),
                boldAndSimpleText(
                    title: 'Göndərilən bölmə: ', info: model.section_name!),
                boldAndSimpleText(
                    title: 'Göndərilən alt bölmə: ',
                    info: model.undersection_name!),
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [const Text('Status: ',  style:  TextStyle(fontWeight: FontWeight.bold)),timerOrIcon(model.counter!)],),
                    )),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>InsideDocumentPage(model));
                    },
                    child: const Text('Bax'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  boldAndSimpleText({required String title, required String info}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                info,
              ),
            ),
          ],
        ),
      ),
    );
  }




  Column sendTime(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(formatDate(DateTime.parse(model.create_date ?? '12.12.2022'),
            [d, '/', mm, '/', yy])),
        Text(formatDate(DateTime.parse(model.create_date ?? '2021-12-12'),
            [HH, ':', nn, ':', ss])),
        const Divider(
          color: Colors.black,
          height: 3,
        ),
        ResponsiveLayout.isPhone(context)
            ? timerOrIcon(model.counter ?? ' 0')
            : const SizedBox()
      ],
    );
  }

  timerOrIcon(String timerStatus) {
    if (timerStatus == '1') {
      return TimerCountdown(
        enableDescriptions: false,
        spacerWidth: 0.5,
        format: CountDownTimerFormat.hoursMinutesSeconds,
        endTime: DateTime.now().add(
          Duration(
            hours: TimerController.getTime(model.counter_end_date ?? "",model).hour,
            minutes: TimerController.getTime(model.counter_end_date ?? "",model).minute,
            seconds: TimerController.getTime(model.counter_end_date ?? "",model).second,
          ),
        ),
        onEnd: () {
         controller.counterUpdate(model,'3');
        },
      );
    } else if (timerStatus == '2') {
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