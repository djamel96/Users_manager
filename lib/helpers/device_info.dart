import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

double getScreeHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}
