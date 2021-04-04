import 'package:flutter/material.dart';

import 'alert_dialog.dart';

Future<void> showMyDialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) =>
          alertDialog(context, message));
}
