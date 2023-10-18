import 'package:flutter/material.dart';

import '../helpers/utils/screen_helper.dart';

class TitlePagesWidget extends StatelessWidget {
  final String text;
  const TitlePagesWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
              ? 22
              : 24),
    );
  }
}
