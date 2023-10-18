import 'package:clean_flutter_template/shared/helpers/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  const TextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.validation,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextFormField(
            textAlign: TextAlign.start,
            cursorColor: AppColors.primary,
            style: Theme.of(context).textTheme.bodyMedium,
            validator: validation,
            onChanged: onChanged,
            decoration: InputDecoration(
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hintText,
                suffixIconColor: AppColors.primary,
                filled: true,
                errorStyle: TextStyle(
                  color: AppColors.red,
                  fontSize: ScreenHelper.width(context) <
                          ScreenHelper.breakpointTablet
                      ? 14
                      : 16,
                  height: 1,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primary, width: 2))),
          ),
        ],
      ),
    );
  }
}
