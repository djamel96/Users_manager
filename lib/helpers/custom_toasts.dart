import 'package:charlie/translations/translation_keys.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

errorToast({String message = andErrorOccurred}) {
  Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}

messageToast(String text,
    {bool top = false,
    Color backgroundColor = Colors.grey,
    Toast toast = Toast.LENGTH_LONG}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: toast,
      gravity: top ? ToastGravity.TOP : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

successToast(String text,
    {bool top = false,
    Color backgroundColor = Colors.grey,
    Toast toast = Toast.LENGTH_LONG}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: toast,
      gravity: top ? ToastGravity.TOP : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
