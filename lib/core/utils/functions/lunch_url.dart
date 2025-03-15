import 'package:bookly_app/core/widgets/custom_error_toast.dart';
import 'package:bookly_app/core/widgets/custom_success_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchThisUrl(Uri url, BuildContext context) async {
  if (!await canLaunchUrl(url)) {
    if (context.mounted) {
      CustomErrorToast.show(context, 'Could not launch the url');
    }
  } else {
    await launchUrl(url);
    if (context.mounted) {
      CustomSuccessToast.show(context, 'Please wait...');
    }
  }
}
