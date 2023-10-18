import 'package:flutter/material.dart';

import '../../../../../../../shared/helpers/utils/screen_helper.dart';

class HomeButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const HomeButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
            ? 150
            : 250,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white,
                  fontSize: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? 14
                      : 16),
            )));
  }
}
