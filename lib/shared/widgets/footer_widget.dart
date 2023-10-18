import 'package:flutter/material.dart';

import '../helpers/utils/screen_helper.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'Copyright 2023 © Dev. Community Mauá',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize:
                  ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                      ? 12
                      : 16,
            ),
      ),
    );
  }
}
