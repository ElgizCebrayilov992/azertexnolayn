import 'package:azertexnolayn/core/model/inconsistency/inconsistency_model.dart';
import 'package:azertexnolayn/screens/admin/pages/new_discrepancy/new_discrepancy_controller.dart';
import 'package:get/get.dart';

class TimerController {
  static NewDiscrepancyController controller = Get.find<NewDiscrepancyController>();
  static DateTime getTime(String time, InconsistencyModel model) {
   
    DateTime stringTime = DateTime.parse(time);
   
    DateTime curentTime = DateTime.now();
    int year = curentTime.year;
    int month = curentTime.month;
    int day = curentTime.day;
    int hour = 0;
    int minute = 0;
    int second = 0;

    int dayString = 0;
    int dayCurent = 0;

    dayString =
        stringTime.year * 12 * 30 + stringTime.month * 30 + stringTime.day;
    dayCurent =
        curentTime.year * 12 * 30 + curentTime.month * 30 + curentTime.day;

    if (dayString > dayCurent) {
      hour = 23 - curentTime.hour;
      minute = 59 - curentTime.minute;
      second = 60 - curentTime.second;
      second = second + stringTime.second;
      if (second >= 60) {
        second = second - 60;
        minute = 1 + stringTime.minute + minute;
        if (minute >= 60) {
          minute = minute - 60;
          hour = hour + stringTime.hour + 1;
        } else {
          hour = hour + stringTime.hour;
        }
      } else {
        minute = stringTime.minute + minute;
        if (minute >= 60) {
          minute = minute - 60;
          hour = 1 + hour + stringTime.hour;
        } else {
          hour = hour + stringTime.hour;
        }
      }
    } else if (dayString == dayCurent) {
      if (curentTime.second <= stringTime.second) {
        second = stringTime.second - curentTime.second;
        if (curentTime.minute <= stringTime.minute) {
          minute = stringTime.minute - curentTime.minute;
          if (curentTime.hour <= stringTime.hour) {
            hour = stringTime.hour - curentTime.hour;
          }
        } else {
          minute = (60 + stringTime.minute) - curentTime.minute;
          if (curentTime.hour <= (stringTime.hour - 1)) {
            hour = stringTime.hour - curentTime.hour;
          } else {
            hour = 22;
            controller.counterUpdate(model, '3');
          }
        }
      } else {
        second = (60 + stringTime.second) - curentTime.second;
        if (curentTime.minute <= (stringTime.minute - 1)) {
          minute = stringTime.minute - curentTime.minute;
          if (curentTime.hour <= stringTime.hour) {
            hour = stringTime.hour - curentTime.hour;
          } else {
            hour = 22;
            controller.counterUpdate(model, '3');
          }
        } else {
          minute = (60 + stringTime.minute) - curentTime.minute;
          if (curentTime.hour <= (stringTime.hour - 1)) {
            hour = stringTime.hour - curentTime.hour;
          } else {
            hour = 22;
            controller.counterUpdate(model, '3');
          }
        }
      }
    }else{
       controller.counterUpdate(model, '3');
    }

    return DateTime(year, month, day, hour, minute, second);
  }
}
