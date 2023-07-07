import 'package:flutter/material.dart';

Future customPopUp(context,
    {required Widget child,
    double padding = 15,
    double height = 516,
    bool barrierDismissible = true,
    EdgeInsets? contentPadding}) async {
  var val = await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
            insetPadding: MediaQuery.of(context).viewInsets +
                EdgeInsets.symmetric(horizontal: padding, vertical: 24.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            contentPadding: contentPadding ??
                const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.

                var width = MediaQuery.of(context).size.width;

                return SizedBox(
                  height: height,
                  width: width,
                  child: child,
                );
              },
            ),
          ));
  return val;
}
