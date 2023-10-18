import 'package:flutter/material.dart';

import '../../../app/app_widget.dart';
import '../../themes/app_text_styles.dart';

void showErrorSnackBarFunction({required String errorMessage, Color? color}) {
  scaffold.showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      backgroundColor: color ?? Colors.black.withOpacity(0.7),
      content: Text(
        errorMessage,
        style: AppTextStyles.headline2.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      )));
}
