import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../shared/domain/entities/user.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';
import '../../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/widgets/footer_widget.dart';
import '../../../../../../../shared/widgets/logo_widget.dart';
import '../../../../../../../shared/widgets/text_field_widget.dart';
import '../../../../../../../shared/widgets/title_pages_widget.dart';
import '../states/update_user_state.dart';
import '../../controller/update_user_controller.dart';

class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<UpdateUserController>();
    final formKey = GlobalKey<FormState>();
    Widget buildError(Failure error) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(error.message,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                )),
      );
    }

    Widget buildSuccess(User user) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(S.of(context).successUpdateUser('', user.id!),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                )),
      );
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
              ? ScreenHelper.width(context)
              : ScreenHelper.breakpointTablet,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                        ? 16
                        : 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LogoWidget(),
                  TitlePagesWidget(text: S.of(context).updatePageTitle),
                  Observer(builder: (_) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            title: S.of(context).fieldId,
                            hintText: S.of(context).fieldHintId,
                            onChanged: (p0) {
                              controller.setUserId(int.parse(p0));
                            },
                            validation: controller.validateUserId,
                          ),
                          TextFieldWidget(
                            title: S.of(context).fieldName,
                            hintText: S.of(context).fieldHintName,
                            onChanged: controller.setUserName,
                            validation: controller.validateUserName,
                          ),
                          TextFieldWidget(
                            title: S.of(context).fieldEmail,
                            hintText: S.of(context).fieldHintEmail,
                            onChanged: controller.setUserEmail,
                            validation: controller.validateUserEmail,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await controller.updateUser();
                                  }
                                },
                                child: controller.state is LoadingUpdateState
                                    ? CircularProgressIndicator(
                                        color: AppColors.white,
                                      )
                                    : Text(
                                        S.of(context).updateTitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(color: AppColors.white),
                                      )),
                          ),
                        ],
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Observer(builder: (_) {
                      var state = controller.state;

                      if (state is ErrorUpdateState) {
                        return buildError(state.error);
                      } else if (state is SuccessUpdateState) {
                        return buildSuccess(state.user);
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ),
                  const FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
