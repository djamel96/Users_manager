import 'dart:io';

import 'package:charlie/helpers/custom_toasts.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

customLaunchURL(String url) async {
  try {
    launchUrl(Uri.parse(url),
        mode: Platform.isAndroid
            ? LaunchMode.externalApplication
            : LaunchMode.platformDefault);
  } catch (e) {
    Clipboard.setData(ClipboardData(text: url));
    messageToast("Link copied to clipboard");
  }
}
