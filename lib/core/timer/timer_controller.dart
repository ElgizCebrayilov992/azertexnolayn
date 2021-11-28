class TimerController {
  
 static DateTime getTime(String time) {
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
            print('yoxxx1x');
            hour = stringTime.hour - curentTime.hour;
          } else {
            print('yoxxxxx');
            hour = 22;
            //TODO timer statusun deyisecek
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
            //TODO timer statusun deyisecek
          }
        } else {
          minute = (60 + stringTime.minute) - curentTime.minute;
          if (curentTime.hour <= (stringTime.hour - 1)) {
            hour = stringTime.hour - curentTime.hour;
          } else {
            hour = 22;
            //TODO timer statusun deyisecek
          }
        }
      }
    }

    return DateTime(year, month, day, hour, minute, second);
  }
}