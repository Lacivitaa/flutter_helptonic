import 'package:flutter/material.dart';

import 'alertDialog.dart';

Future<void> showMyDialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) =>
          alertDialog(context, message));
}
