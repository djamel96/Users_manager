import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker {
  static Future<DateTime?> selectDatePop(BuildContext context,
      {DateTime? begin, DateTime? last, DateTime? initialDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: begin ?? DateTime(1920, 3),
      lastDate: DateTime.now().add(const Duration(days: 365 * 20)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.appMain100,
          ),
          child: child!,
        );
      },
    );
    return picked;
  }

  static Future<TimeOfDay?> selectTimePop(BuildContext context,
      {TimePickerEntryMode? timePickerEntryMode,
      TimeOfDay? initialTime}) async {
    TimeOfDay? selectedTime24Hour;

    await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      initialEntryMode: timePickerEntryMode ?? TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: ThemeData(
              primaryColor: AppColors.appMain100,
            ),
            child: child!,
          ),
        );
      },
    ).then((onValue) {
      selectedTime24Hour = onValue;
    });
    return selectedTime24Hour;
  }

  static getDateWithDayAndYear(DateTime? dateTime, {String nullReturn = ""}) {
    if (dateTime == null) return nullReturn;

    var formattedDate = DateFormat('EEE, dd MMM yyyy', Get.locale?.languageCode)
        .format(dateTime); //format :Sat, 08 Apr 2001
    return formattedDate;
  }

  static String getTimeString(TimeOfDay? time, {String nullReturn = ""}) {
    if (time == null) return nullReturn;
    int hour = time.hour;
    int minute = time.minute;
    String shour = '';
    String sminute = '';

    if (minute < 10) sminute = "0";
    if (hour < 10) shour = '0';
    shour += hour.toString();
    sminute += minute.toString();

    return '$shour:$sminute';
  }
}
