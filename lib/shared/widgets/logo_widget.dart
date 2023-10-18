import 'package:flutter/material.dart';

import '../helpers/utils/screen_helper.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
          ? ScreenHelper.width(context)
          : 500,
      height: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
          ? 180
          : 300,
      child: const Image(
          image: AssetImage('assets/images/logo-dev.png'), fit: BoxFit.fill),
    );
  }
}
